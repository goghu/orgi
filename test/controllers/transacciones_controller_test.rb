require 'test_helper'

class TransaccionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transaccione = transacciones(:one)
  end

  test "should get index" do
    get transacciones_url
    assert_response :success
  end

  test "should get new" do
    get new_transaccione_url
    assert_response :success
  end

  test "should create transaccione" do
    assert_difference('Transaccione.count') do
      post transacciones_url, params: { transaccione: { borrado: @transaccione.borrado, categoria_id: @transaccione.categoria_id, estado: @transaccione.estado, fecha: @transaccione.fecha, monto: @transaccione.monto, nota: @transaccione.nota, proyecto_id: @transaccione.proyecto_id, tipo: @transaccione.tipo, user_id: @transaccione.user_id } }
    end

    assert_redirected_to transaccione_url(Transaccione.last)
  end

  test "should show transaccione" do
    get transaccione_url(@transaccione)
    assert_response :success
  end

  test "should get edit" do
    get edit_transaccione_url(@transaccione)
    assert_response :success
  end

  test "should update transaccione" do
    patch transaccione_url(@transaccione), params: { transaccione: { borrado: @transaccione.borrado, categoria_id: @transaccione.categoria_id, estado: @transaccione.estado, fecha: @transaccione.fecha, monto: @transaccione.monto, nota: @transaccione.nota, proyecto_id: @transaccione.proyecto_id, tipo: @transaccione.tipo, user_id: @transaccione.user_id } }
    assert_redirected_to transaccione_url(@transaccione)
  end

  test "should destroy transaccione" do
    assert_difference('Transaccione.count', -1) do
      delete transaccione_url(@transaccione)
    end

    assert_redirected_to transacciones_url
  end
end
