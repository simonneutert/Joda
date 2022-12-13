# frozen_string_literal: true

#
# extens base class with api specific routing
#
class App < Roda
  hash_branch 'api' do |r|
    r.on 'health' do
      response.status = 200
      next
    end

    r.on 'v1' do
      r.hash_routes '/api/v1'
    end
  end
end
