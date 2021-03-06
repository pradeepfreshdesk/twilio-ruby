##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class SipList < ListResource
            class DomainList < ListResource
              ##
              # Initialize the DomainList
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid A 34 character string that uniquely identifies this
              #   resource.
              # @return [DomainList] DomainList
              def initialize(version, account_sid: nil)
                super(version)

                # Path Solution
                @solution = {
                    account_sid: account_sid
                }
                @uri = "/Accounts/#{@solution[:account_sid]}/SIP/Domains.json"
              end

              ##
              # Lists DomainInstance records from the API as a list.
              # Unlike stream(), this operation is eager and will load `limit` records into
              # memory before returning.
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #                   guarantees to never return more than limit.  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
              #  the default value of 50 records.  If no page_size is                      defined
              #  but a limit is defined, stream() will attempt to read                      the
              #  limit with the most efficient page size,                      i.e. min(limit, 1000)
              # @return [Array] Array of up to limit results
              def list(limit: nil, page_size: nil)
                self.stream(
                    limit: limit,
                    page_size: page_size
                ).entries
              end

              ##
              # Streams DomainInstance records from the API as an Enumerable.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [Integer] limit Upper limit for the number of records to return.                  stream()
              #  guarantees to never return more than limit.                  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
              #  the default value of 50 records.                      If no page_size is defined
              #                       but a limit is defined, stream() will attempt to                      read the
              #  limit with the most efficient page size,                       i.e. min(limit, 1000)
              # @return [Enumerable] Enumerable that will yield up to limit results
              def stream(limit: nil, page_size: nil)
                limits = @version.read_limits(limit, page_size)

                page = self.page(
                    page_size: limits[:page_size],
                )

                @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
              end

              ##
              # When passed a block, yields DomainInstance records from the API.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              def each
                limits = @version.read_limits

                page = self.page(
                    page_size: limits[:page_size],
                )

                @version.stream(page,
                                limit: limits[:limit],
                                page_limit: limits[:page_limit]).each {|x| yield x}
              end

              ##
              # Retrieve a single page of DomainInstance records from the API.
              # Request is executed immediately.
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of DomainInstance
              def page(page_token: :unset, page_number: :unset, page_size: :unset)
                params = Twilio::Values.of({
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                })
                response = @version.page(
                    'GET',
                    @uri,
                    params
                )
                DomainPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of DomainInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of DomainInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                DomainPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of DomainInstance records from the API.
              # Request is executed immediately.
              # @param [String] domain_name The unique address you reserve on Twilio to which
              #   you route your SIP traffic
              # @param [String] friendly_name A user-specified, human-readable name for the
              #   trigger.
              # @param [String] auth_type The types of authentication you have mapped to your
              #   domain
              # @param [String] voice_url The URL Twilio will request when this domain receives
              #   a call
              # @param [String] voice_method The HTTP method to use with the voice_url
              # @param [String] voice_fallback_url The URL that Twilio will use if an error
              #   occurs retrieving or executing the TwiML requested by VoiceUrl
              # @param [String] voice_fallback_method The HTTP method Twilio will use when
              #   requesting the VoiceFallbackUrl
              # @param [String] voice_status_callback_url The URL that Twilio will request to
              #   pass status parameters
              # @param [String] voice_status_callback_method The voice_status_callback_method
              # @return [DomainInstance] Newly created DomainInstance
              def create(domain_name: nil, friendly_name: :unset, auth_type: :unset, voice_url: :unset, voice_method: :unset, voice_fallback_url: :unset, voice_fallback_method: :unset, voice_status_callback_url: :unset, voice_status_callback_method: :unset)
                data = Twilio::Values.of({
                    'DomainName' => domain_name,
                    'FriendlyName' => friendly_name,
                    'AuthType' => auth_type,
                    'VoiceUrl' => voice_url,
                    'VoiceMethod' => voice_method,
                    'VoiceFallbackUrl' => voice_fallback_url,
                    'VoiceFallbackMethod' => voice_fallback_method,
                    'VoiceStatusCallbackUrl' => voice_status_callback_url,
                    'VoiceStatusCallbackMethod' => voice_status_callback_method,
                })

                payload = @version.create(
                    'POST',
                    @uri,
                    data: data
                )

                DomainInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Api.V2010.DomainList>'
              end
            end

            class DomainPage < Page
              ##
              # Initialize the DomainPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [DomainPage] DomainPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of DomainInstance
              # @param [Hash] payload Payload response from the API
              # @return [DomainInstance] DomainInstance
              def get_instance(payload)
                DomainInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Api.V2010.DomainPage>'
              end
            end

            class DomainContext < InstanceContext
              ##
              # Initialize the DomainContext
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The account_sid
              # @param [String] sid The domain sid that uniquely identifies the resource
              # @return [DomainContext] DomainContext
              def initialize(version, account_sid, sid)
                super(version)

                # Path Solution
                @solution = {
                    account_sid: account_sid,
                    sid: sid,
                }
                @uri = "/Accounts/#{@solution[:account_sid]}/SIP/Domains/#{@solution[:sid]}.json"

                # Dependents
                @ip_access_control_list_mappings = nil
                @credential_list_mappings = nil
              end

              ##
              # Fetch a DomainInstance
              # @return [DomainInstance] Fetched DomainInstance
              def fetch
                params = Twilio::Values.of({})

                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )

                DomainInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Update the DomainInstance
              # @param [String] auth_type The auth_type
              # @param [String] friendly_name A user-specified, human-readable name for the
              #   trigger.
              # @param [String] voice_fallback_method The voice_fallback_method
              # @param [String] voice_fallback_url The voice_fallback_url
              # @param [String] voice_method The HTTP method to use with the voice_url
              # @param [String] voice_status_callback_method The voice_status_callback_method
              # @param [String] voice_status_callback_url The voice_status_callback_url
              # @param [String] voice_url The voice_url
              # @return [DomainInstance] Updated DomainInstance
              def update(auth_type: :unset, friendly_name: :unset, voice_fallback_method: :unset, voice_fallback_url: :unset, voice_method: :unset, voice_status_callback_method: :unset, voice_status_callback_url: :unset, voice_url: :unset)
                data = Twilio::Values.of({
                    'AuthType' => auth_type,
                    'FriendlyName' => friendly_name,
                    'VoiceFallbackMethod' => voice_fallback_method,
                    'VoiceFallbackUrl' => voice_fallback_url,
                    'VoiceMethod' => voice_method,
                    'VoiceStatusCallbackMethod' => voice_status_callback_method,
                    'VoiceStatusCallbackUrl' => voice_status_callback_url,
                    'VoiceUrl' => voice_url,
                })

                payload = @version.update(
                    'POST',
                    @uri,
                    data: data,
                )

                DomainInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Deletes the DomainInstance
              # @return [Boolean] true if delete succeeds, true otherwise
              def delete
                @version.delete('delete', @uri)
              end

              ##
              # Access the ip_access_control_list_mappings
              # @return [IpAccessControlListMappingList]
              # @return [IpAccessControlListMappingContext] if sid was passed.
              def ip_access_control_list_mappings(sid=:unset)
                raise ArgumentError, 'sid cannot be nil' if sid.nil?

                if sid != :unset
                  return IpAccessControlListMappingContext.new(
                      @version,
                      @solution[:account_sid],
                      @solution[:sid],
                      sid,
                  )
                end

                unless @ip_access_control_list_mappings
                  @ip_access_control_list_mappings = IpAccessControlListMappingList.new(
                      @version,
                      account_sid: @solution[:account_sid],
                      domain_sid: @solution[:sid],
                  )
                end

                @ip_access_control_list_mappings
              end

              ##
              # Access the credential_list_mappings
              # @return [CredentialListMappingList]
              # @return [CredentialListMappingContext] if sid was passed.
              def credential_list_mappings(sid=:unset)
                raise ArgumentError, 'sid cannot be nil' if sid.nil?

                if sid != :unset
                  return CredentialListMappingContext.new(
                      @version,
                      @solution[:account_sid],
                      @solution[:sid],
                      sid,
                  )
                end

                unless @credential_list_mappings
                  @credential_list_mappings = CredentialListMappingList.new(
                      @version,
                      account_sid: @solution[:account_sid],
                      domain_sid: @solution[:sid],
                  )
                end

                @credential_list_mappings
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Api.V2010.DomainContext #{context}>"
              end
            end

            class DomainInstance < InstanceResource
              ##
              # Initialize the DomainInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] account_sid A 34 character string that uniquely identifies this
              #   resource.
              # @param [String] sid The domain sid that uniquely identifies the resource
              # @return [DomainInstance] DomainInstance
              def initialize(version, payload, account_sid: nil, sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'api_version' => payload['api_version'],
                    'auth_type' => payload['auth_type'],
                    'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                    'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                    'domain_name' => payload['domain_name'],
                    'friendly_name' => payload['friendly_name'],
                    'sid' => payload['sid'],
                    'uri' => payload['uri'],
                    'voice_fallback_method' => payload['voice_fallback_method'],
                    'voice_fallback_url' => payload['voice_fallback_url'],
                    'voice_method' => payload['voice_method'],
                    'voice_status_callback_method' => payload['voice_status_callback_method'],
                    'voice_status_callback_url' => payload['voice_status_callback_url'],
                    'voice_url' => payload['voice_url'],
                    'subresource_uris' => payload['subresource_uris'],
                }

                # Context
                @instance_context = nil
                @params = {
                    'account_sid' => account_sid,
                    'sid' => sid || @properties['sid'],
                }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [DomainContext] DomainContext for this DomainInstance
              def context
                unless @instance_context
                  @instance_context = DomainContext.new(
                      @version,
                      @params['account_sid'],
                      @params['sid'],
                  )
                end
                @instance_context
              end

              ##
              # @return [String] The unique id of the account that sent the message
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] The Twilio API version used to process the message
              def api_version
                @properties['api_version']
              end

              ##
              # @return [String] The types of authentication mapped to the domain
              def auth_type
                @properties['auth_type']
              end

              ##
              # @return [Time] The date this resource was created
              def date_created
                @properties['date_created']
              end

              ##
              # @return [Time] The date this resource was last updated
              def date_updated
                @properties['date_updated']
              end

              ##
              # @return [String] The unique address on Twilio to route SIP traffic
              def domain_name
                @properties['domain_name']
              end

              ##
              # @return [String] A user-specified, human-readable name for the trigger.
              def friendly_name
                @properties['friendly_name']
              end

              ##
              # @return [String] A string that uniquely identifies the SIP Domain
              def sid
                @properties['sid']
              end

              ##
              # @return [String] The URI for this resource
              def uri
                @properties['uri']
              end

              ##
              # @return [String] HTTP method used with voice_fallback_url
              def voice_fallback_method
                @properties['voice_fallback_method']
              end

              ##
              # @return [String] URL Twilio will request if an error occurs in executing TwiML
              def voice_fallback_url
                @properties['voice_fallback_url']
              end

              ##
              # @return [String] HTTP method to use with voice_url
              def voice_method
                @properties['voice_method']
              end

              ##
              # @return [String] The voice_status_callback_method
              def voice_status_callback_method
                @properties['voice_status_callback_method']
              end

              ##
              # @return [String] URL that Twilio will request with status updates
              def voice_status_callback_url
                @properties['voice_status_callback_url']
              end

              ##
              # @return [String] URL Twilio will request when receiving a call
              def voice_url
                @properties['voice_url']
              end

              ##
              # @return [String] The subresource_uris
              def subresource_uris
                @properties['subresource_uris']
              end

              ##
              # Fetch a DomainInstance
              # @return [DomainInstance] Fetched DomainInstance
              def fetch
                context.fetch
              end

              ##
              # Update the DomainInstance
              # @param [String] auth_type The auth_type
              # @param [String] friendly_name A user-specified, human-readable name for the
              #   trigger.
              # @param [String] voice_fallback_method The voice_fallback_method
              # @param [String] voice_fallback_url The voice_fallback_url
              # @param [String] voice_method The HTTP method to use with the voice_url
              # @param [String] voice_status_callback_method The voice_status_callback_method
              # @param [String] voice_status_callback_url The voice_status_callback_url
              # @param [String] voice_url The voice_url
              # @return [DomainInstance] Updated DomainInstance
              def update(auth_type: :unset, friendly_name: :unset, voice_fallback_method: :unset, voice_fallback_url: :unset, voice_method: :unset, voice_status_callback_method: :unset, voice_status_callback_url: :unset, voice_url: :unset)
                context.update(
                    auth_type: auth_type,
                    friendly_name: friendly_name,
                    voice_fallback_method: voice_fallback_method,
                    voice_fallback_url: voice_fallback_url,
                    voice_method: voice_method,
                    voice_status_callback_method: voice_status_callback_method,
                    voice_status_callback_url: voice_status_callback_url,
                    voice_url: voice_url,
                )
              end

              ##
              # Deletes the DomainInstance
              # @return [Boolean] true if delete succeeds, true otherwise
              def delete
                context.delete
              end

              ##
              # Access the ip_access_control_list_mappings
              # @return [ip_access_control_list_mappings] ip_access_control_list_mappings
              def ip_access_control_list_mappings
                context.ip_access_control_list_mappings
              end

              ##
              # Access the credential_list_mappings
              # @return [credential_list_mappings] credential_list_mappings
              def credential_list_mappings
                context.credential_list_mappings
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Api.V2010.DomainInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end