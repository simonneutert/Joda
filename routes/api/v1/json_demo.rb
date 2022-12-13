# frozen_string_literal: true

#
# sample /api/v1/json-demo endpoint
#
class App
  hash_routes '/api/v1' do |r|
    r.on 'json-demo' do
      { status: 200,
        data: { lorem: :ipsum,
                bacon: :yummy } }
    end
  end
end
