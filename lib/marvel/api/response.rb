module Marvel
  class Api
    class Response
      attr_reader :status, :headers, :body, :etag, :offset, :limit, :total,
                  :count, :results

      def initialize(status:, headers:, body:)
        @status = status
        @headers = headers
        @body = body

        parse_body
      end

      private

      def parse_body
        data = JSON.parse(body)

        @etag = data['etag']
        methods = %w[offset limit total count results]
        methods.each do |method_name|
          value = data['data'][method_name]
          instance_variable_set(:"@#{method_name}", value)
        end
      rescue
        nil
      end
    end
  end
end
