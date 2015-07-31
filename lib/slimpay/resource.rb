module Slimpay
  # An abstract resource to be inherited from.
  #
  # Defines HAPI resource non-semantic methods.
  class Resource < Base
    def initialize
      @resource_name = self.class.to_s.demodulize.downcase.pluralize
      super
    end

    # Shortcut method to get a resource with only resource's reference.
    #
    # The above example shall return the same result as
    #   get_mandates({creditorReference: @creditor_reference, reference: 1})
    #
    # ===== Example:
    #   >> mandates = Slimpay::Mandate.new
    #   >> mandates.get_one
    # ===== Arguments:
    #   reference: (String)
    def get_one(reference = 1)
      url = "#{@endpoint}/creditors/#{@creditor_reference}/#{@resource_name}/#{reference}"
      response = HTTParty.get(url, headers: options)
      Slimpay.answer(response)
    end
  end
end
