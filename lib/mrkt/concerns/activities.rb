module Mrkt
  module Activities
    def get_activity_types
      get("/rest/v1/activities/types.json")
    end

    def get_activities(first_paging_token, date, activity_type_ids)
      activities = []
      next_page_token = first_paging_token
      more_data = true

      while more_data
        params = { nextPageToken: next_page_token, activityTypeIds: activity_type_ids }
        response = get("/rest/v1/activities.json", params)

        result = response[:result] || []

        if Date.parse(result.last[:activityDate]) > date
          result.reject! do |activity|
            Date.parse(activity[:activityDate]) > date
          end
          activities.push(*result)
          break
        end

        activities.push(*result)

        more_data = response[:moreResult]
        next_page_token = response[:nextPageToken]
      end

      activities
    end
  end
end
