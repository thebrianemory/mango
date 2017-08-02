defmodule Mango.CatalogTest do
  use ExUnit.Case
  alias Mango.Catalog

  test "list_products/0 returns all products" do
    [p1, p2] = Catalog.list_products
    assert p1 == "Tomato"
    assert p2 == "Apple"
  end
end
