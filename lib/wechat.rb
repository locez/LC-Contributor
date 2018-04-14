require 'net/http'
require 'json'

module Wechat
    @@corpid = Rails.configuration.wechat['corpid']
    @@corpsecret = Rails.configuration.wechat['corpsecret']
    @@agentid = Rails.configuration.wechat['agentid']
    @@users = Rails.configuration.wechat['users']
    def getAccessToken
        api = "https://qyapi.weixin.qq.com/cgi-bin/gettoken?"
        res = Net::HTTP.get_response(URI.parse([api, 
                                                "corpid=", @@corpid, 
                                                "&corpsecret=", @@corpsecret].join)) 
        json = JSON.parse(res.body)
        accessToken = json['access_token']
        expiresTime = json['expires_in'] + `date +"%s"`.to_i
        [accessToken, expiresTime]
    end

    def sendMessage content
        @accessToken, @expiresTime = getAccessToken if @accessToken.nil?
        if @expiresTime > `date +"%s"`.to_i
            @accessToken,@expiresTime = getAccessToken
        end

        api = "https://qyapi.weixin.qq.com/cgi-bin/message/send?"

        begin
            uri = URI [api, "access_token=", @accessToken].join
            req = Net::HTTP::Post.new uri
            req.body = { "touser": @@users, 
                         "msgtype": "text",
                         "agentid": @@agentid,
                         "text": { "content": content }
            }.to_json
            req.content_type = "application/json"
            res = Net::HTTP.start uri.hostname, uri.port,
                :use_ssl =>  uri.scheme == 'https' do |http|
                http.request req
            end

            json = JSON.parse(res.body)
            if json['errcode'] == 42001
                raise "AccessToken haved expired"
            end
        rescue  e
            puts $!
            @accessToken, @expiresTime = getAccessToken
            puts e.backtrace.inspect 
            retry
        end
    end
end

