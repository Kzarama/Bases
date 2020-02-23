package com.bases.controllers;

import java.net.URL;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.ResourceBundle;

import javax.swing.JOptionPane;

import javafx.collections.FXCollections;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.CheckBox;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.DatePicker;
import javafx.scene.control.Tab;
import javafx.scene.control.TabPane;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.layout.AnchorPane;
import oracle.jdbc.OracleTypes;
/**
 * interfaz del proyecto de bases de datos
 * inicia la interfaz del proyecto
 */
public class SolicitudController implements Initializable {
	/**
	 * atributos de la clase
	 * atributos ventana
	 */
	@FXML
    private AnchorPane root;
	/**
	 * atributos de la clase
	 * atributos de la ventana
	 */
    @FXML
    private TabPane tabPane;
	/**
	 * tab de la seccion de solicitud
	 */
	@FXML
    private Tab tabSolicitud;
	/**
	 * tab de la seccion de cliente
	 */
	@FXML
    private Tab tabCliente;
	/**
	 * tab de la seccion de producto
	 */
	@FXML
    private Tab tabProducto;
	/**
	 * campos de texto para los atributos a añadir a la bd
	 */
    @FXML
    private TextField fieldNombreCliente;

    @FXML
    private TextField fieldCedulaCliente;

    @FXML
    private TextField fieldDireccionCliente;

    @FXML
    private TextField fieldTelefonoCliente;
    
    @FXML
    private TextField fieldCodigoProducto;
    
    @FXML
    private TextField fieldEstadoSol;
    
    @FXML
    private TextField fieldNuevoTipoSol;
    
    @FXML
    private TextField fieldNuevoTipoPro;
    /**
     * checkbox para marcar si la tabla de cliente o producto ya esta creado
     */
    @FXML
    private CheckBox checkCliente;
	
    @FXML
    private CheckBox checkProducto;
    /**
     * choicebox para elegir estado y tipo de solicitud y tipo de producto
     */
    @FXML
    private ChoiceBox<String> choiceEstadoSol;

    @FXML
    private ChoiceBox<String> choiceTipoSol;
    
    @FXML
    private ChoiceBox<String> choiceTipoProducto;
    /**
     * textarea para ingresar la descripcion de la solicitud y del producto
     */
    @FXML
    private TextArea textAreaDescripcionSol;
    
    @FXML
    private TextArea textAreaDescripcionProducto;
    /**
     * datepicker para ingresar la fecha de nacimiento del cliente
     */
    @FXML
    private DatePicker fieldFechaNacimientoCliente;
    /**
     * boton para agregar los cambios a la bd
     */
    @FXML
    private Button btnAgregar;
    /**
     * metodo para agregar una solicitud a la bd que toma los datos desde los campos de la interfaz
     * @param event - evento del boton agregar
     */
    @FXML
    void agregarSolicitud(ActionEvent event) {
    	/**
    	 * carga el driver de la libreria de la bd
    	 */
    	cargarDriver();
    	/**
    	 * metodos para tomar datos
    	 * solicitud
    	 */
    	String codigo = "" + ((int)(Math.random() * 100 + 100));
    	String estado = choiceEstadoSol.getValue();
    	if (estado.equals("Otro")) {
    		estado = fieldEstadoSol.getText();
    	}
    	String descripcion = textAreaDescripcionSol.getText();
    	String tipo = choiceTipoSol.getValue();
    	if (tipo.equals("Otro")) {
    		tipo = fieldNuevoTipoSol.getText();
    	}
    	LocalDate localdate = LocalDate.now();
    	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/YYYY");
    	String fechaCreacion = localdate.format(formatter);
    	/**
    	 * metodos para tomar datos
    	 * cliente
    	 */
    	String clienteCedula = fieldCedulaCliente.getText();
    	String nombre;
    	String direccion;
    	String telefono;
    	String fechaNacimiento;
    	if (!checkCliente.isSelected()) {
	    	nombre = fieldNombreCliente.getText();
	    	direccion = fieldDireccionCliente.getText();
	    	telefono = fieldTelefonoCliente.getText();
	    	LocalDate fechaN = fieldFechaNacimientoCliente.getValue();
	    	fechaNacimiento = fechaN.format(formatter);
    	} else {
	    	nombre = "0";
	    	direccion = "0";
	    	telefono = "0";
	    	fechaNacimiento = "01/01/2000";
    	}
    	/**
    	 * metodos para tomar datos
    	 * producto
    	 */
    	String codigoProducto = fieldCodigoProducto.getText();;
    	String descripcionProducto;
    	String tipoProducto;
    	if (!checkProducto.isSelected()) {
	    	descripcionProducto = textAreaDescripcionProducto.getText();
	    	tipoProducto = choiceTipoProducto.getValue();
	    	if (tipoProducto.equals("Otro")) {
	    		tipoProducto = fieldNuevoTipoPro.getText();
	    	}
    	} else {
	    	descripcionProducto = "0";
	    	tipoProducto = "0";
    	}
    	/**
    	 * llamado al metodo de crear solicitud
    	 */
    	String error = createSolicitud(codigo, estado, descripcion, clienteCedula, codigoProducto, fechaCreacion, tipo, nombre, fechaNacimiento, direccion, telefono, descripcionProducto, tipoProducto);
    	/**
    	 * si existe un error lo muestra en pantalla
    	 */
    	if (error.equals("")) {
    		JOptionPane.showMessageDialog(null, "se ha registrado con exito");
    	} else {
    		String typeError = error.charAt(0) == '1' ? " valor duplicado" : error.charAt(0) == '2' ? " datos no encontrados" : " desconocido";
    		JOptionPane.showMessageDialog(null,  "Ha ocurrido un error con " + error.substring(1) + "\nNumero de error: " + error.charAt(0) + typeError);
    	}
    }
    /**
     * ingresa los datos en los choisebox
     */
	public void initialize(URL location, ResourceBundle resources) {
		choiceEstadoSol.setItems(FXCollections.observableArrayList(obtenerDatosEstadoSol()));
		choiceTipoProducto.setItems(FXCollections.observableArrayList(obtenerDatosTipoProducto()));
		choiceTipoSol.setItems(FXCollections.observableArrayList(obtenerDatosTipoSol()));	
	}
	/**
	 * toma los estados de solicitud desde la bd
	 * @return String[] con los estados de solicitud
	 */
	private String[] obtenerDatosEstadoSol() {
		Connection con = null;
		CallableStatement cs = null;
		ArrayList<String> data = new ArrayList<String>();
		try {
//			con = DriverManager.getConnection("jdbc:Oracle:thin:@//172.16.0.103:1522/ESTUD", "P09551_1_25", "P09551_1_25");
			con = DriverManager.getConnection("jdbc:Oracle:thin:@//200.3.193.24:1522/ESTUD", "P09551_1_25", "P09551_1_25");
			
			cs = con.prepareCall("{ ? = call pkCrearSolicitudN3.pRetornarEstadoSol }");
			cs.registerOutParameter(1, OracleTypes.CURSOR);
			cs.execute();
			ResultSet rs = (ResultSet) cs.getObject(1);
			while (rs.next()) {
				data.add(rs.getString(1));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				cs.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
			try {
				con.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		String[] estadoSol = new String[data.size() + 1];
		for (int i = 0; i < data.size(); i++) {
			estadoSol[i] = data.get(i);
		}
		estadoSol[data.size()] = "Otro";
		return estadoSol;
	}
	/**
	 * toma los tipos de solicitud desde la bd
	 * @return String[] con los tipos de solicitud
	 */
	private String[] obtenerDatosTipoSol() {
		Connection con = null;
		CallableStatement cs = null;
		ArrayList<String> data = new ArrayList<String>();
		try {
//			con = DriverManager.getConnection("jdbc:Oracle:thin:@//172.16.0.103:1522/ESTUD", "P09551_1_25", "P09551_1_25");
			con = DriverManager.getConnection("jdbc:Oracle:thin:@//200.3.193.24:1522/ESTUD", "P09551_1_25", "P09551_1_25");
			
			cs = con.prepareCall("{ ? = call pkCrearSolicitudN3.pRetornarTipoSol }");
			cs.registerOutParameter(1, OracleTypes.CURSOR);
			cs.execute();
			ResultSet rs = (ResultSet) cs.getObject(1);
			while (rs.next()) {
				data.add(rs.getString(1));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				cs.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
			try {
				con.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		String[] tipoSol = new String[data.size() + 1];
		for (int i = 0; i < data.size(); i++) {
			tipoSol[i] = data.get(i);
		}
		tipoSol[data.size()] = "Otro";
		return tipoSol;
	}
	/**
	 * toma los tipos de producto desde la bd
	 * @return String[] con los tipos de producto
	 */
	private String[] obtenerDatosTipoProducto() {
		Connection con = null;
		CallableStatement cs = null;
		ArrayList<String> data = new ArrayList<String>();
		try {
//			con = DriverManager.getConnection("jdbc:Oracle:thin:@//172.16.0.103:1522/ESTUD", "P09551_1_25", "P09551_1_25");
			con = DriverManager.getConnection("jdbc:Oracle:thin:@//200.3.193.24:1522/ESTUD", "P09551_1_25", "P09551_1_25");
			
			cs = con.prepareCall("{ ? = call pkCrearSolicitudN3.pRetornarTipoProducto }");
			cs.registerOutParameter(1, OracleTypes.CURSOR);
			cs.execute();
			ResultSet rs = (ResultSet) cs.getObject(1);
			while (rs.next()) {
				data.add(rs.getString(1));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				cs.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
			try {
				con.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		String[] tipoPro = new String[data.size() + 1];
		for (int i = 0; i < data.size(); i++) {
			tipoPro[i] = data.get(i);
		}
		tipoPro[data.size()] = "Otro";
		return tipoPro;
	}
	/**
	 * metodo que envia la solicitud, el cliente y el producto a la bd para que sean añadidos
	 * @param codigo - codigo de solicitud
	 * @param estado - estado de solicitud
	 * @param descripcion - descripcion de solicitud
	 * @param clienteCedula - cedula del cliente
	 * @param codigoProducto - codigo del producto
	 * @param fechaCreacion- fecha de creacion de la solicitud
	 * @param tipo - tipo de solicitud
	 * @param nombre - nombre del cliente
	 * @param fechaNacimiento - fecha de nacimiento de cliente
	 * @param direccion - direccion del cliente
	 * @param telefono - numero de telefono del cliente
	 * @param descripcionProducto - descripcion del producto
	 * @param tipoProducto - tipo de producto
	 * @return error - retorna el error de la bd
	 */
	public String createSolicitud(String codigo, String estado, String descripcion, String clienteCedula, String codigoProducto, String fechaCreacion, String tipo, String nombre, String fechaNacimiento, String direccion, String telefono, String descripcionProducto, String tipoProducto) {
		Connection con = null;
		CallableStatement cs = null;
		int errorCodCliente = 0;
		String errorNameCliente = "";
		int errorCodProducto = 0;
		String errorNameProducto = "";
		int errorCodSolicitud = 0;
		String errorNameSolicitud = "";
		try {
//			con = DriverManager.getConnection("jdbc:Oracle:thin:@//172.16.0.103:1522/ESTUD", "P09551_1_25", "P09551_1_25");
			con = DriverManager.getConnection("jdbc:Oracle:thin:@//200.3.193.24:1522/ESTUD", "P09551_1_25", "P09551_1_25");
			cs = con.prepareCall("{call pkCrearSolicitudN3.pCrearSolicitudN3 (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
			cs.setString(1, codigo);
			cs.setString(2, estado);
			cs.setString(3, descripcion);
			cs.setString(4, clienteCedula);
			cs.setString(5, codigoProducto);
			cs.setString(6, fechaCreacion);
			cs.setString(7, tipo);
			cs.setString(8, nombre);
			cs.setString(9, fechaNacimiento);
			cs.setString(10, direccion);
			cs.setString(11, telefono);
			cs.setString(12, descripcionProducto);
			cs.setString(13, tipoProducto);
			cs.registerOutParameter(14, Types.INTEGER);
			cs.registerOutParameter(15, Types.VARCHAR);
			cs.registerOutParameter(16, Types.INTEGER);
			cs.registerOutParameter(17, Types.VARCHAR);
			cs.registerOutParameter(18, Types.INTEGER);
			cs.registerOutParameter(19, Types.VARCHAR);
			cs.execute();
			errorCodCliente = cs.getInt(14);
			errorNameCliente = cs.getString(15);
			errorCodProducto = cs.getInt(16);
			errorNameProducto = cs.getString(17);
			errorCodSolicitud = cs.getInt(18);
			errorNameSolicitud = cs.getString(19);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				cs.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
			try {
				con.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		if (errorCodCliente != 0) {
			return errorCodCliente + errorNameCliente;
		} else if (errorCodProducto != 0) {
			return errorCodProducto + errorNameProducto;
		} else if (errorCodSolicitud != 0) {
			if (errorCodSolicitud == 9) {
				return errorCodSolicitud + "no se ha encontrado al usuario o el producto";
			} else {
				return errorCodSolicitud + errorNameSolicitud;
			}
		} else {
			return "";
		}
	}
	/**
	 * metodo que carga el driver de oracle
	 */
	private void cargarDriver() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.out.println("¡Oracle JDBC Driver no encontrado! " + e.getMessage());
		}
	}
	
}
