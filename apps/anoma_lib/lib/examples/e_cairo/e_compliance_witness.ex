defmodule Examples.ECairo.EComplianceWitness do
  alias Anoma.CairoResource.ComplianceWitness

  alias Examples.ECairo.EResource
  alias Examples.ECommitmentTree

  @spec a_compliance_private_input :: binary()
  def a_compliance_private_input() do
    input_nf_key = <<1::256>>
    rcv = <<3::256>>
    eph_root = Cairo.random_felt() |> :binary.list_to_bin()
    {_ct, merkle_proof, _anchor} = ECommitmentTree.a_merkle_proof()

    compliance_private_input =
      %ComplianceWitness{
        input_resource: EResource.a_fixed_resource(),
        merkel_proof: merkle_proof,
        output_resource: EResource.a_fixed_output_resource(),
        input_nf_key: input_nf_key,
        eph_root: eph_root,
        rcv: rcv
      }
      |> ComplianceWitness.to_json_string()

    compliance_private_input
  end
end
