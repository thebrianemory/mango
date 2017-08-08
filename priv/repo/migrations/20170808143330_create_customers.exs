defmodule Mango.Repo.Migrations.CreateCustomers do
  use Ecto.Migration

  def change do
    create table(:customers) do
      add :name, :string
      add :email, :string
      add :phone, :string
      add :residence_area, :string
      add :password_hash, :string

      timestamps()
    end

    create unique_index(:customers, [:email])
  end
end
