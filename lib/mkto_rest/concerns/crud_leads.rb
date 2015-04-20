module MktoRest
  module CrudLeads
    def get_leads(filter_type, filter_values, fields: nil, batch_size: nil, next_page_token: nil)
      params = {
        filterType: filter_type,
        filterValues: filter_values.join(',')
      }
      params[:fields] = fields if fields
      params[:batchSize] = batch_size if batch_size
      params[:nextPageToken] = next_page_token if next_page_token

      get('/rest/v1/leads.json', params)
    end

    def createupdate_leads(leads, action: 'createOrUpdate', lookup_field: nil, partition_name: nil)
      post('/rest/v1/leads.json') do |req|
        params = {
          action: action,
          input: leads
        }
        params[:lookupField] = lookup_field if lookup_field
        params[:partitionName] = partition_name if partition_name

        json_payload(req, params)
      end
    end

    def delete_leads(leads)
      delete('/rest/v1/leads.json') do |req|
        json_payload(req, input: leads.map { |lead_id| { id: lead_id } })
      end
    end

    def json_payload(req, payload)
      req.headers[:content_type] = 'application/json'
      req.body = JSON.generate(payload)
    end

    def associate_lead(id, cookie)
      post("/rest/v1/leads/#{id}/associate.json", cookie: cookie)
    end
  end
end