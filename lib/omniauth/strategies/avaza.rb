# frozen_string_literal: true

require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    # Strategy for Avaza
    class Avaza < OmniAuth::Strategies::OAuth2
      DEFAULT_SCOPE = 'read_users'

      option :name, 'avaza'

      option :client_options, {
        site: 'https://avaza.com/',
        authorize_url: 'https://any.avaza.com/oauth2/authorize',
        token_url: 'https://any.avaza.com/oauth2/token',
        api_url: 'https://api.avaza.com'
      }

      uid { raw_info['user_id'] }

      info do
        {
          name: "#{raw_info['firstname']} #{raw_info['lastname']}",
          email: raw_info['email'],
          first_name: raw_info['firstname'],
          last_name: raw_info['lastname'],
          phone: raw_info['phone']
        }
      end

      credentials do
        hash = { token: access_token.token }
        hash['refresh_token'] = access_token.refresh_token if access_token.expires? && access_token.refresh_token
        hash['expires_at'] = expires_at if access_token.expires?
        hash['expires'] = access_token.expires?
        hash
      end

      extra { { raw_info: raw_info } }

      def callback_url
        options[:redirect_uri] || (full_host + script_name + callback_path)
      end

      def raw_info
        @raw_info ||= access_token.get(user_profile_api_endpoint).parsed['users'].first
      end

      def authorize_params
        super.tap do |params|
          %w[scope state].each do |value|
            next unless request.params[value]

            params[value.to_sym] = request.params[value]

            session['omniauth.state'] = params[:state] if value == 'state'
          end

          params[:scope] ||= DEFAULT_SCOPE
        end
      end

      private

      def user_profile_api_endpoint
        "#{options[:client_options][:api_url]}/api/UserProfile?CurrentUserOnly=true"
      end

      def expires_at
        Time.now.to_i + access_token.expires_in.to_i
      end
    end
  end
end
