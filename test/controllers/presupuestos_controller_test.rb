require 'test_helper'

class PresupuestosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @presupuesto = presupuestos(:one)
  end

  test "should get index" do
    get presupuestos_url
    assert_response :success
  end

  test "should get new" do
    get new_presupuesto_url
    assert_response :success
  end

  test "should create presupuesto" do
    assert_difference('Presupuesto.count') do
      post presupuestos_url, params: { presupuesto: { borrado: @presupuesto.borrado, categoria_id: @presupuesto.categoria_id, estado: @presupuesto.estado, fecha_fin: @presupuesto.fecha_fin, fecha_inicio: @presupuesto.fecha_inicio, monto: @presupuesto.monto, user_id: @presupuesto.user_id } }
    end

    assert_redirected_to presupuesto_url(Presupuesto.last)
  end

  test "should show presupuesto" do
    get presupuesto_url(@presupuesto)
    assert_response :success
  end

  test "should get edit" do
    get edit_presupuesto_url(@presupuesto)
    assert_response :success
  end

  test "should update presupuesto" do
    patch presupuesto_url(@presupuesto), params: { presupuesto: { borrado: @presupuesto.borrado, categoria_id: @presupuesto.categoria_id, estado: @presupuesto.estado, fecha_fin: @presupuesto.fecha_fin, fecha_inicio: @presupuesto.fecha_inicio, monto: @presupuesto.monto, user_id: @presupuesto.user_id } }
    assert_redirected_to presupuesto_url(@presupuesto)
  end

  test "should destroy presupuesto" do
    assert_difference('Presupuesto.count', -1) do
      delete presupuesto_url(@presupuesto)
    end

    assert_redirected_to presupuestos_url
  end
end
