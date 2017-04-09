RSpec.describe Marvel::Api do
  it 'has an http_service accessor' do
    expect(Marvel::Api).to respond_to(:http_service)
    expect(Marvel::Api).to respond_to(:http_service=)
  end

  describe 'constants' do
    it 'has a version' do
      expect(Marvel::Api.const_defined?('VERSION')).to be_truthy
    end

    it 'has a filled default server' do
      expect(Marvel::Api.const_defined?('DEFAULT_SERVER')).to be_truthy
      expect(Marvel::Api::DEFAULT_SERVER).to eq('http://gateway.marvel.com')
    end
  end

  it 'has an attr_reader for public key' do
    public_key = 'public-key'
    private_key = 'private-key'
    service = Marvel::Api.new(public_key, private_key)
    expect(service.public_key).to eq(public_key)
  end

  it 'has an attr_reader for private key' do
    public_key = 'public-key'
    private_key = 'private-key'
    service = Marvel::Api.new(public_key, private_key)
    expect(service.public_key).to eq(public_key)
  end

  it 'has an attr_reader for options with default value' do
    public_key = 'public-key'
    private_key = 'private-key'
    service = Marvel::Api.new(public_key, private_key)
    expect(service.options).to eq({})
  end

  it 'has an attr_reader for options with passed value' do
    public_key = 'public-key'
    private_key = 'private-key'
    options = { proxy: 'localhost' }
    service = Marvel::Api.new(public_key, private_key, options)
    expect(service.options).to eq(proxy: 'localhost')
  end

  describe 'api methods' do
    let(:service) do
      Marvel::Api.new(
        ENV['MARVEL_PUBLIC_KEY'], ENV['MARVEL_PRIVATE_KEY']
      )
    end

    context 'characters resource' do
      let(:character_id) { 1011334 }

      it_behaves_like 'collection response' do
        let(:label) { 'characters' }
        let(:make_call) { service.characters(limit: 1) }
      end

      it_behaves_like 'single response' do
        let(:label) { 'character' }
        let(:make_call) { service.character(character_id) }
      end

      context 'comics sub resource' do
        it_behaves_like 'collection response' do
          let(:label) { 'character_comics' }
          let(:make_call) { service.character_comics(character_id, limit: 1) }
        end
      end

      context 'events sub resource' do
        it_behaves_like 'collection response' do
          let(:label) { 'character_events' }
          let(:make_call) { service.character_events(character_id, limit: 1) }
        end
      end

      context 'series sub resource' do
        it_behaves_like 'collection response' do
          let(:label) { 'character_series' }
          let(:make_call) { service.character_series(character_id, limit: 1) }
        end
      end

      context 'stories sub resource' do
        it_behaves_like 'collection response' do
          let(:label) { 'character_stories' }
          let(:make_call) { service.character_stories(character_id, limit: 1) }
        end
      end
    end

    context 'comics resource' do
      let(:comic_id) { 25320 }

      it_behaves_like 'collection response' do
        let(:label) { 'comics' }
        let(:make_call) { service.comics(limit: 1) }
      end

      it_behaves_like 'single response' do
        let(:label) { 'comic' }
        let(:make_call) { service.comic(comic_id) }
      end

      context 'characters sub resource' do
        it_behaves_like 'collection response' do
          let(:label) { 'comic_characters' }
          let(:make_call) { service.comic_characters(comic_id, limit: 1) }
        end
      end

      context 'creators sub resource' do
        it_behaves_like 'collection response' do
          let(:label) { 'comic_creators' }
          let(:make_call) { service.comic_creators(comic_id, limit: 1) }
        end
      end

      context 'events sub resource' do
        it_behaves_like 'collection response' do
          let(:label) { 'comic_events' }
          let(:make_call) { service.comic_events(comic_id, limit: 1) }
        end
      end

      context 'stories sub resource' do
        it_behaves_like 'collection response' do
          let(:label) { 'comic_stories' }
          let(:make_call) { service.comic_stories(comic_id, limit: 1) }
        end
      end
    end

    context 'creators resource' do
      let(:creator_id) { 7968 }

      it_behaves_like 'collection response' do
        let(:label) { 'creators' }
        let(:make_call) { service.creators(limit: 1) }
      end

      it_behaves_like 'single response' do
        let(:label) { 'creator' }
        let(:make_call) { service.creator(creator_id) }
      end

      context 'comics sub resource' do
        it_behaves_like 'collection response' do
          let(:label) { 'creator_comics' }
          let(:make_call) { service.creator_comics(creator_id, limit: 1) }
        end
      end

      context 'events sub resource' do
        it_behaves_like 'collection response' do
          let(:label) { 'creator_events' }
          let(:make_call) { service.creator_events(creator_id, limit: 1) }
        end
      end

      context 'series sub resource' do
        it_behaves_like 'collection response' do
          let(:label) { 'creator_series' }
          let(:make_call) { service.creator_series(creator_id, limit: 1) }
        end
      end

      context 'stories sub resource' do
        it_behaves_like 'collection response' do
          let(:label) { 'creator_stories' }
          let(:make_call) { service.creator_stories(creator_id, limit: 1) }
        end
      end
    end

    context 'events resource' do
      let(:event_id) { 116 }

      it_behaves_like 'collection response' do
        let(:label) { 'events' }
        let(:make_call) { service.events(limit: 1) }
      end

      it_behaves_like 'single response' do
        let(:label) { 'event' }
        let(:make_call) { service.event(event_id) }
      end

      context 'characters sub resource' do
        it_behaves_like 'collection response' do
          let(:label) { 'event_characters' }
          let(:make_call) { service.event_characters(event_id, limit: 1) }
        end
      end

      context 'comics sub resource' do
        it_behaves_like 'collection response' do
          let(:label) { 'event_comics' }
          let(:make_call) { service.event_comics(event_id, limit: 1) }
        end
      end

      context 'creators sub resource' do
        it_behaves_like 'collection response' do
          let(:label) { 'event_creators' }
          let(:make_call) { service.event_creators(event_id, limit: 1) }
        end
      end

      context 'series sub resource' do
        it_behaves_like 'collection response' do
          let(:label) { 'event_series' }
          let(:make_call) { service.event_series(event_id, limit: 1) }
        end
      end

      context 'stories sub resource' do
        it_behaves_like 'collection response' do
          let(:label) { 'event_stories' }
          let(:make_call) { service.event_stories(event_id, limit: 1) }
        end
      end
    end

    context 'series resource' do
      let(:serie_id) { 18454 }

      it_behaves_like 'collection response' do
        let(:label) { 'series' }
        let(:make_call) { service.series(limit: 1) }
      end

      it_behaves_like 'single response' do
        let(:label) { 'serie' }
        let(:make_call) { service.serie(serie_id) }
      end

      context 'characters sub resource' do
        it_behaves_like 'collection response' do
          let(:label) { 'serie_characters' }
          let(:make_call) { service.serie_characters(serie_id, limit: 1) }
        end
      end

      context 'comics sub resource' do
        it_behaves_like 'collection response' do
          let(:label) { 'serie_comics' }
          let(:make_call) { service.serie_comics(serie_id, limit: 1) }
        end
      end

      context 'creators sub resource' do
        it_behaves_like 'collection response' do
          let(:label) { 'serie_creators' }
          let(:make_call) { service.serie_creators(serie_id, limit: 1) }
        end
      end

      context 'events sub resource' do
        it_behaves_like 'collection response' do
          let(:label) { 'serie_events' }
          let(:make_call) { service.serie_events(serie_id, limit: 1) }
        end
      end

      context 'stories sub resource' do
        it_behaves_like 'collection response' do
          let(:label) { 'serie_stories' }
          let(:make_call) { service.serie_stories(serie_id, limit: 1) }
        end
      end
    end

    context 'stories resource' do
      let(:story_id) { 7 }

      it_behaves_like 'collection response' do
        let(:label) { 'stories' }
        let(:make_call) { service.stories(limit: 1) }
      end

      it_behaves_like 'single response' do
        let(:label) { 'story' }
        let(:make_call) { service.story(story_id) }
      end

      context 'characters sub resource' do
        it_behaves_like 'collection response' do
          let(:label) { 'story_characters' }
          let(:make_call) { service.story_characters(story_id, limit: 1) }
        end
      end

      context 'comics sub resource' do
        it_behaves_like 'collection response' do
          let(:label) { 'story_comics' }
          let(:make_call) { service.story_comics(story_id, limit: 1) }
        end
      end

      context 'creators sub resource' do
        it_behaves_like 'collection response' do
          let(:label) { 'story_creators' }
          let(:make_call) { service.story_creators(story_id, limit: 1) }
        end
      end

      context 'events sub resource' do
        it_behaves_like 'collection response' do
          let(:label) { 'story_events' }
          let(:make_call) { service.story_events(story_id, limit: 1) }
        end
      end

      context 'series sub resource' do
        it_behaves_like 'collection response' do
          let(:label) { 'story_series' }
          let(:make_call) { service.story_series(story_id, limit: 1) }
        end
      end
    end
  end
end
