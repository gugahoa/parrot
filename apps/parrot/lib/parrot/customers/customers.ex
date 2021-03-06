defmodule Parrot.Customers do
  @moduledoc """
  The Customers context.
  """

  import Ecto.Query, warn: false
  alias Parrot.Repo

  alias Parrot.Customers.{Integration, Customer}

  @doc """
  Returns the list of integrations.

  ## Examples

      iex> list_integrations()
      [%Integration{}, ...]

  """
  def list_integrations do
    Repo.all(Integration)
  end

  @doc """
  Gets a single integration.

  Raises `Ecto.NoResultsError` if the Integration does not exist.

  ## Examples

      iex> get_integration!(123)
      %Integration{}

      iex> get_integration!(456)
      ** (Ecto.NoResultsError)

  """
  def get_integration!(id), do: Repo.get!(Integration, id)
  def get_integration(app_id), do: Repo.get_by(Integration, app_id: app_id)

  @doc """
  Creates a integration.

  ## Examples

      iex> create_integration(%{field: value})
      {:ok, %Integration{}}

      iex> create_integration(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_integration(attrs \\ %{}) do
    %Integration{}
    |> Integration.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a integration.

  ## Examples

      iex> update_integration(integration, %{field: new_value})
      {:ok, %Integration{}}

      iex> update_integration(integration, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_integration(%Integration{} = integration, attrs) do
    integration
    |> Integration.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Integration.

  ## Examples

      iex> delete_integration(integration)
      {:ok, %Integration{}}

      iex> delete_integration(integration)
      {:error, %Ecto.Changeset{}}

  """
  def delete_integration(%Integration{} = integration) do
    Repo.delete(integration)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking integration changes.

  ## Examples

      iex> change_integration(integration)
      %Ecto.Changeset{source: %Integration{}}

  """
  def change_integration(%Integration{} = integration) do
    Integration.changeset(integration, %{})
  end

  def get_customer(app_id) do
    Repo.get_by(Customer, app_id: app_id)
  end
end
