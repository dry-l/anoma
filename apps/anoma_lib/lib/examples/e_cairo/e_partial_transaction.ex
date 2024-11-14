defmodule Examples.ECairo.EPartialTransaction do
  alias Anoma.CairoResource.PartialTransaction
  alias Examples.ECairo.EProofRecord

  @spec a_partial_transaction() :: PartialTransaction.t()
  def a_partial_transaction do
    proof = EProofRecord.a_compliance_proof()
    input_resource_logic = proof
    output_resource_logic = proof

    ptx = %PartialTransaction{
      logic_proofs: [input_resource_logic, output_resource_logic],
      compliance_proofs: [proof]
    }

    ptx
  end
end