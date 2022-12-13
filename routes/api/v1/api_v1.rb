# frozen_string_literal: true

#
# api v1 scoped routing
#
class App < Roda
  hash_routes '/api/v1' do |r|
    r.on 'health' do
      { status: 200,
        health: :wealth }
    end
  end
end
