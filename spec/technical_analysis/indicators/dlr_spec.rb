require 'technical-analysis'
require 'spec_helper'

describe 'Indicators' do
  describe "DLR" do
    input_data = SpecHelper.get_test_data(:close)
    indicator = TechnicalAnalysis::Dlr

    describe 'Daily Log Return' do
      it 'Calculates Daily Log Return' do
        output = indicator.calculate(input_data, price_key: :close)
        normalized_output = output.map(&:to_hash)

        expected_output = [
          {:date_time=>"2019-01-09T00:00:00.000Z", :dlr=>0.01683917971506794},
          {:date_time=>"2019-01-08T00:00:00.000Z", :dlr=>0.01888364670315034},
          {:date_time=>"2019-01-07T00:00:00.000Z", :dlr=>-0.0022283003244291597},
          {:date_time=>"2019-01-04T00:00:00.000Z", :dlr=>0.04180329782029066},
          {:date_time=>"2019-01-03T00:00:00.000Z", :dlr=>-0.10492438427688831},
          {:date_time=>"2019-01-02T00:00:00.000Z", :dlr=>0.0011404677153263752},
          {:date_time=>"2018-12-31T00:00:00.000Z", :dlr=>0.009618827546033224},
          {:date_time=>"2018-12-28T00:00:00.000Z", :dlr=>0.0005121966947240164},
          {:date_time=>"2018-12-27T00:00:00.000Z", :dlr=>-0.006510938359150324},
          {:date_time=>"2018-12-26T00:00:00.000Z", :dlr=>0.06805256711339175},
          {:date_time=>"2018-12-24T00:00:00.000Z", :dlr=>-0.026214701847591528},
          {:date_time=>"2018-12-21T00:00:00.000Z", :dlr=>-0.039672259323895565},
          {:date_time=>"2018-12-20T00:00:00.000Z", :dlr=>-0.02555848551661011},
          {:date_time=>"2018-12-19T00:00:00.000Z", :dlr=>-0.03168848455571821},
          {:date_time=>"2018-12-18T00:00:00.000Z", :dlr=>0.012908878993777004},
          {:date_time=>"2018-12-17T00:00:00.000Z", :dlr=>-0.0093498343683261},
          {:date_time=>"2018-12-14T00:00:00.000Z", :dlr=>-0.032520774492099586},
          {:date_time=>"2018-12-13T00:00:00.000Z", :dlr=>0.010880860180775654},
          {:date_time=>"2018-12-12T00:00:00.000Z", :dlr=>0.002783290222441408},
          {:date_time=>"2018-12-11T00:00:00.000Z", :dlr=>-0.00573575767570937},
          {:date_time=>"2018-12-10T00:00:00.000Z", :dlr=>0.00656632250750863},
          {:date_time=>"2018-12-07T00:00:00.000Z", :dlr=>-0.03630829170624626},
          {:date_time=>"2018-12-06T00:00:00.000Z", :dlr=>-0.011212092072018474},
          {:date_time=>"2018-12-04T00:00:00.000Z", :dlr=>-0.044985593831335616},
          {:date_time=>"2018-12-03T00:00:00.000Z", :dlr=>0.034345698370823956},
          {:date_time=>"2018-11-30T00:00:00.000Z", :dlr=>-0.005417040583021469},
          {:date_time=>"2018-11-29T00:00:00.000Z", :dlr=>-0.007711763925503673},
          {:date_time=>"2018-11-28T00:00:00.000Z", :dlr=>0.037731825412945244},
          {:date_time=>"2018-11-27T00:00:00.000Z", :dlr=>-0.002178525198011193},
          {:date_time=>"2018-11-26T00:00:00.000Z", :dlr=>0.013433080838346925},
          {:date_time=>"2018-11-23T00:00:00.000Z", :dlr=>-0.02572691808848715},
          {:date_time=>"2018-11-21T00:00:00.000Z", :dlr=>-0.0011307102064021337},
          {:date_time=>"2018-11-20T00:00:00.000Z", :dlr=>-0.04895697028998929},
          {:date_time=>"2018-11-19T00:00:00.000Z", :dlr=>-0.04043883708306672},
          {:date_time=>"2018-11-16T00:00:00.000Z", :dlr=>0.011014814954241668},
          {:date_time=>"2018-11-15T00:00:00.000Z", :dlr=>0.024379198463276127},
          {:date_time=>"2018-11-14T00:00:00.000Z", :dlr=>-0.028654045970026604},
          {:date_time=>"2018-11-13T00:00:00.000Z", :dlr=>-0.010041492241593453},
          {:date_time=>"2018-11-12T00:00:00.000Z", :dlr=>-0.051687201448600596},
          {:date_time=>"2018-11-09T00:00:00.000Z", :dlr=>-0.01946981300300202},
          {:date_time=>"2018-11-08T00:00:00.000Z", :dlr=>-0.006978328672237313},
          {:date_time=>"2018-11-07T00:00:00.000Z", :dlr=>0.029877500317357083},
          {:date_time=>"2018-11-06T00:00:00.000Z", :dlr=>0.010755975020512992},
          {:date_time=>"2018-11-05T00:00:00.000Z", :dlr=>-0.028799017690867113},
          {:date_time=>"2018-11-02T00:00:00.000Z", :dlr=>-0.0686329326726632},
          {:date_time=>"2018-11-01T00:00:00.000Z", :dlr=>0.015235626165565584},
          {:date_time=>"2018-10-31T00:00:00.000Z", :dlr=>0.025732630512992103},
          {:date_time=>"2018-10-30T00:00:00.000Z", :dlr=>0.004981915647820579},
          {:date_time=>"2018-10-29T00:00:00.000Z", :dlr=>-0.018948623129528868},
          {:date_time=>"2018-10-26T00:00:00.000Z", :dlr=>-0.0160517090105079},
          {:date_time=>"2018-10-25T00:00:00.000Z", :dlr=>0.021661496781179467},
          {:date_time=>"2018-10-24T00:00:00.000Z", :dlr=>-0.03490373037505153},
          {:date_time=>"2018-10-23T00:00:00.000Z", :dlr=>0.009382539847836957},
          {:date_time=>"2018-10-22T00:00:00.000Z", :dlr=>0.006091481696142526},
          {:date_time=>"2018-10-19T00:00:00.000Z", :dlr=>0.01511525802908552},
          {:date_time=>"2018-10-18T00:00:00.000Z", :dlr=>-0.023651064679340767},
          {:date_time=>"2018-10-17T00:00:00.000Z", :dlr=>-0.0043307687122485835},
          {:date_time=>"2018-10-16T00:00:00.000Z", :dlr=>0.02179786426382509},
          {:date_time=>"2018-10-15T00:00:00.000Z", :dlr=>-0.021617789532325248},
          {:date_time=>"2018-10-12T00:00:00.000Z", :dlr=>0.03509614368752819},
          {:date_time=>"2018-10-11T00:00:00.000Z", :dlr=>-0.008867076040336814},
          {:date_time=>"2018-10-10T00:00:00.000Z", :dlr=>-0.047433479205543055},
          {:date_time=>"2018-10-09T00:00:00.000Z", :dlr=>0.0}
        ]

        expect(normalized_output).to eq(expected_output)
      end

      it "Throws exception if not enough data" do
        expect {indicator.calculate([], price_key: :close)}.to raise_exception(TechnicalAnalysis::Validation::ValidationError)
      end

      it 'Returns the symbol' do
        indicator_symbol = indicator.indicator_symbol
        expect(indicator_symbol).to eq('dlr')
      end

      it 'Returns the name' do
        indicator_name = indicator.indicator_name
        expect(indicator_name).to eq('Daily Log Return')
      end

      it 'Returns the valid options' do
        valid_options = indicator.valid_options
        expect(valid_options).to eq(%i(price_key))
      end

      it 'Validates options' do
        valid_options = { price_key: :close }
        options_validated = indicator.validate_options(valid_options)
        expect(options_validated).to eq(true)
      end

      it 'Throws exception for invalid options' do
        invalid_options = { test: 10 }
        expect { indicator.validate_options(invalid_options) }.to raise_exception(TechnicalAnalysis::Validation::ValidationError)
      end

      it 'Calculates minimum data size' do
        options = {}
        expect(indicator.min_data_size(options)).to eq(1)
      end
    end
  end
end
