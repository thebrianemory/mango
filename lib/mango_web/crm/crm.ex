defmodule Mango.CRM do
  alias Mango.Repo
  alias Mango.CRM.Customer

  def build_customer(attrs \\ %{}) do
    %Customer{}
    |> Customer.changeset(attrs)
  end
end
