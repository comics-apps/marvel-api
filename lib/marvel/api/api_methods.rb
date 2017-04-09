module Marvel
  class Api
    module ApiMethods
      METHODS = {
        characters: :character,
        comics: :comic,
        creators: :creator,
        events: :event,
        series: :serie,
        stories: :story
      }.freeze

      SUBMETHODS = {
        characters: %i[comics events series stories],
        comics: %i[characters creators events stories],
        creators: %i[comics events series stories],
        events: %i[characters comics creators series stories],
        series: %i[characters comics creators events stories],
        stories: %i[characters comics creators events series]
      }.freeze

      METHODS.each do |method, single_method|
        define_method(method) do |args = {}|
          api_call(method, args)
        end

        define_method(single_method) do |id, args = {}|
          api_call("#{method}/#{id}", args)
        end

        SUBMETHODS[method].each do |submethod|
          define_method("#{single_method}_#{submethod}") do |id, args = {}|
            api_call("#{method}/#{id}/#{submethod}", args)
          end
        end
      end
    end
  end
end
