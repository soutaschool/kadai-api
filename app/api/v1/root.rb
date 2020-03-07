module V1
    class Root < Grape::API
        version 'v1'
        format :json

        mount V1::TodoItems
        mount V1::TodoComments
    end
end