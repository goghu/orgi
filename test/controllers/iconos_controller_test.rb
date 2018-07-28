require 'test_helper'

class IconosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @icono = iconos(:one)
  end

  test "should get index" do
    get iconos_url
    assert_response :success
  end

  test "should get new" do
    get new_icono_url
    assert_response :success
  end

  test "should create icono" do
    assert_difference('Icono.count') do
      post iconos_url, params: { icono: { direccion: @icono.direccion, nombre: @icono.nombre } }
    end

    assert_redirected_to icono_url(Icono.last)
  end

  test "should show icono" do
    get icono_url(@icono)
    assert_response :success
  end

  test "should get edit" do
    get edit_icono_url(@icono)
    assert_response :success
  end

  test "should update icono" do
    patch icono_url(@icono), params: { icono: { direccion: @icono.direccion, nombre: @icono.nombre } }
    assert_redirected_to icono_url(@icono)
  end

  test "should destroy icono" do
    assert_difference('Icono.count', -1) do
      delete icono_url(@icono)
    end

    assert_redirected_to iconos_url
  end
end
