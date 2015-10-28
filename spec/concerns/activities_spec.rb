describe Mrkt::Activities do
  include_context 'initialized client'

  describe '#get_activity_types' do
    let(:response_stub) do
      {
        "requestId":"6e78#148ad3b76f1",
        "success":true,
        "result":[
          {
            "id":1,
            "name":"Visit Webpage",
            "description":"User visits web page",
            "primaryAttribute":{
              "name":"Webpage ID",
              "dataType":"integer"
            },
            "attributes":[
              {
                "name":"Client IP Address",
                "dataType":"string"
              },
              {
                "name":"Query Parameters",
                "dataType":"string"
              },
              {
                "name":"Referrer URL",
                "dataType":"string"
              },
              {
                "name":"Search Engine",
                "dataType":"string"
              },
              {
                "name":"Search Query",
                "dataType":"string"
              },
              {
                "name":"User Agent",
                "dataType":"string"
              },
              {
                "name":"Webpage URL",
                "dataType":"string"
              }
            ]
          },
          {
            "id":2,
            "name":"Fill Out Form",
            "description":"User fills out and submits form on web page",
            "primaryAttribute":{
              "name":"Webform ID",
              "dataType":"integer"
            },
            "attributes":[
              {
                "name":"Client IP Address",
                "dataType":"string"
              },
              {
                "name":"Form Fields",
                "dataType":"text"
              },
              {
                "name":"Query Parameters",
                "dataType":"string"
              },
              {
                "name":"Referrer URL",
                "dataType":"string"
              },
              {
                "name":"User Agent",
                "dataType":"string"
              },
              {
                "name":"Webpage ID",
                "dataType":"integer"
              }
            ]
          }
        ]
      }
    end
    subject { client.get_activity_types }

    before do
      stub_request(:get, "https://#{host}/rest/v1/activities/types.json")
        .to_return(json_stub(response_stub))
    end

    it { is_expected.to eq(response_stub) }
  end

  describe '#get_activities' do
    let(:response_stub) do
      {
        "requestId":"a9ae#148add1e53d",
        "success":true,
        "nextPageToken":"GIYDAOBNGEYS2MBWKQYDAORQGA5DAMBOGAYDAKZQGAYDALBRGA3TQ===",
        "moreResult":true,
        "result":[
          {
            "id":2,
            "leadId":6,
            "activityDate":"2013-09-26T06:56:35+0000",
            "activityTypeId":12,
            "primaryAttributeValueId":6,
            "primaryAttributeValue":"Owyliphys Iledil",
            "attributes":[
              {
                "name":"Source Type",
                "value":"Web page visit"
              },
              {
                "name":"Source Info",
                "value":"http://search.yahoo.com/search?p=train+cappuccino+army"
              }
            ]
          },
          {
            "id":3,
            "leadId":9,
            "activityDate":"2013-12-28T00:39:45+0000",
            "activityTypeId":1,
            "primaryAttributeValueId":4,
            "primaryAttributeValue":"anti-phishing",
            "attributes":[
              {
                "name":"Query Parameters",
                "value":null
              },
              {
                "name":"Client IP Address",
                "value":"203.141.7.100"
              },
              {
                "name":"User Agent",
                "value":"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.14) Gecko/20080404 Firefox/2.0.0.14"
              },
              {
                "name":"Webpage ID",
                "value":4
              },
              {
                "name":"Webpage URL",
                "value":"/anti-phishing.html"
              },
              {
                "name":"Referrer URL",
                "value":null
              },
              {
                "name":"Search Engine",
                "value":null
              },
              {
                "name":"Search Query",
                "value":null
              }
            ]
          }
        ]
      }
    end
    subject { client.get_activities(start_date) }

    before do
      stub_request(:get, "https://#{host}/rest/v1/activities/types.json")
        .to_return(json_stub(response_stub))
    end

    xit { is_expected.to eq(response_stub) }
  end
end
