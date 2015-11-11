describe Mrkt::Opportunities do
  include_context 'initialized client'

  describe '#get_opportunities' do
    let(:filter_type) { 'seq' }
    let(:filter_values) { [0, 1] }
    let(:response_stub) do
      {
        "requestId":"e42b#14272d07d78",
        "success":true,
        "result":[
          {
            "seq":0,
            "marketoGUID":"da42707c-4dc4-4fc1-9fef-f30a3017240a",
            "externalOpportunityId":"19UYA31581L000000",
            "name":"Chairs",
            "description":"Chairs",
            "amount":"1604.47",
            "source":"Inbound Sales Call/Email"
          },
          {
            "seq":1,
            "marketoGUID":"da42707c-4dc4-4fc1-9fef-f30a3017240b",
            "externalOpportunityId":"29UYA31581L000000",
            "name":"Big Dog Day Care-Phase12",
            "description":"Big Dog Day Care-Phase12",
            "amount":"1604.47",
            "source":"Email"
          }
        ]
      }
    end
    subject { client.get_opportunities(filter_type, filter_values) }

    before do
      stub_request(:get, "https://#{host}/rest/v1/opportunities.json")
        .with(query: { filterType: filter_type, filterValues: filter_values.join(',') })
        .to_return(json_stub(response_stub))
    end

    it { is_expected.to eq(response_stub) }
  end
end
