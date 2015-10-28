module Mrkt
  module Activities
    def get_activity_types
      get("/rest/v1/activities/types.json")
    end

    #def get_activities(start_date)
      #activities = []
      #next_page_token = get_first_paging_token(date: date)
      #more_data = true

      #while more_data do
        #endpoint = "/rest/v1/activities.json"
        #params = { "nextPageToken" => next_page_token }
        #url = request_url(endpoint, params) + "&" + activity_types

        #response = Typhoeus.get(request_url)
        #activities = JSON.parse(response.body)

        #more_data = activities['moreResult']
        #next_page_token = activities['nextPageToken']

        #activities.append(activities)
      #end
    #end
  end
end
