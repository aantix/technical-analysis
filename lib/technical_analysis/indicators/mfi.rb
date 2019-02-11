module TechnicalAnalysis
  class Mfi < Indicator

    # Returns the symbol of the technical indicator
    #
    # @return [String] A string of the symbol of the technical indicator
    def self.indicator_symbol
      "mfi"
    end

    # Returns the name of the technical indicator
    #
    # @return [String] A string of the name of the technical indicator
    def self.indicator_name
      "Money Flow Index"
    end

    # Returns an array of valid keys for options for this technical indicator
    #
    # @return [Array] An array of keys as symbols for valid options for this technical indicator
    def self.valid_options
      %i(period)
    end

    # Validates the provided options for this technical indicator
    #
    # @param options [Hash] The options for the technical indicator to be validated
    #
    # @return [Boolean] Returns true if options are valid or raises a ValidationError if they're not
    def self.validate_options(options)
      Validation.validate_options(options, valid_options)
    end

    # Calculates the minimum number of observations needed to calculate the technical indicator
    #
    # @param options [Hash] The options for the technical indicator
    #
    # @return [Integer] Returns the minimum number of observations needed to calculate the technical
    #    indicator based on the options provided
    def self.min_data_size(period: 14)
      period.to_i + 1
    end

    # Calculates the money flow index (MFI) for the data over the given period
    # https://en.wikipedia.org/wiki/Money_flow_index
    #
    # @param data [Array] Array of hashes with keys (:date_time, :high, :low, :close, :volume)
    # @param period [Integer] The given period to calculate the MFI
    #
    # @return [Array<Hash>]
    #
    #   An array of hashes with keys (:date_time, :value). Example output:
    #
    #     [
    #       {:date_time => "2019-01-09T00:00:00.000Z", :value => 50.72343663578981},
    #       {:date_time => "2019-01-08T00:00:00.000Z", :value => 50.1757147722236},
    #     ]
    def self.calculate(data, period: 14)
      period = period.to_i
      Validation.validate_numeric_data(data, :high, :low, :close, :volume)
      Validation.validate_length(data, min_data_size(period: period))

      data = data.sort_by_hash_date_time_asc

      output = []
      prev_typical_price = StockCalculation.typical_price(data.first)
      raw_money_flows = []

      data.shift

      data.each do |v|
        typical_price = StockCalculation.typical_price(v)

        if typical_price < prev_typical_price
          money_flow = (-1.0 * typical_price * v[:volume])
        elsif typical_price > prev_typical_price
          money_flow = (typical_price * v[:volume])
        else
          money_flow = 0.0
        end

        raw_money_flows << money_flow

        if raw_money_flows.size == period
          positive_period_flows = raw_money_flows.map { |rmf| rmf.positive? ? rmf : 0 }.sum
          negative_period_flows = raw_money_flows.map { |rmf| rmf.negative? ? rmf.abs : 0 }.sum

          money_flow_ratio = (positive_period_flows / negative_period_flows)
          mfi = (100.00 - (100.00 / (1.0 + money_flow_ratio)))

          output << { date_time: v[:date_time], value: mfi }

          raw_money_flows.shift
        end

        prev_typical_price = typical_price
      end

      output.sort_by_hash_date_time_desc
    end

  end
end
