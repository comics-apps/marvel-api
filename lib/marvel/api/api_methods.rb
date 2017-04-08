module Marvel
  class Api
    module ApiMethods
      def comics(args = {})
        api_call('comics', args)
      end
    end
  end
end
