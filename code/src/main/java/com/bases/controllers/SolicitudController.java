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

public class SolicitudController implements Initializable {

    @FXML
    private AnchorPane root;

    @FXML
    private TabPane tabPane;

    @FXML
    private Tab tabSolicitud;

    @FXML
    private ChoiceBox<String> choiceEstadoSol;

    @FXML
    private ChoiceBox<String> choiceTipoSol;

    @FXML
    private TextArea textAreaDescripcionSol;

    @FXML
    private Tab tabCliente;

    @FXML
    private CheckBox checkCliente;

    @FXML
    private TextField fieldNombreCliente;

    @FXML
    private TextField fieldCedulaCliente;

    @FXML
    private TextField fieldDireccionCliente;

    @FXML
    private TextField fieldTelefonoCliente;

    @FXML
    private DatePicker fieldFechaNacimientoCliente;

    @FXML
    private Tab tabProducto;

    @FXML
    private CheckBox checkProducto;

    @FXML
    private TextField fieldCodigoProducto;
    
    @FXML
    private TextField fieldEstadoSol;
    
    @FXML
    private TextField fieldNuevoTipoSol;
    
    @FXML
    private TextField fieldNuevoTipoPro;
    
    @FXML
    private TextArea textAreaDescripcionProducto;

    @FXML
    private Button btnAgregar;

    @FXML
    private ChoiceBox<String> choiceTipoProducto;

    @FXML
    void agregarSolicitud(ActionEvent event) {
    	
    	cargarDriver();
    	
    	//solicitud
    	String codigo = "" + ((int)(Math.random()*10 + 100));
    	String estado = choiceEstadoSol.getValue();
    	if (estado.equals("Otro")) {
    		estado = fieldEstadoSol.getText();
    	}
    	String descripcion = textAreaDescripcionSol.getText();
    	String tipo = choiceTipoSol.getValue();
    	if (tipo.equals("Otro")) {
    		tipo = fieldEstadoSol.getText();
    	}
    	LocalDate localdate = LocalDate.now();
    	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/YYYY");
    	String fechaCreacion = localdate.format(formatter);
    	
    	//cliente
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
    	
    	//producto
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
    	
    	int errorCodCliente = 0;
    	String errorNameCliente = "";
    	int errorCodProducto = 0;
    	String errorNameProducto = "";
    	int errorCodSolicitud = 0;
    	String errorNameSolicitud = "";
    	
    	String error = createSolicitud(codigo, estado, descripcion, clienteCedula, codigoProducto, fechaCreacion, tipo, nombre, fechaNacimiento, direccion, telefono, descripcionProducto, tipoProducto, errorCodCliente, errorNameCliente, errorCodProducto, errorNameProducto, errorCodSolicitud, errorNameSolicitud);
    	
    	if (error.equals("")) {
    		JOptionPane.showMessageDialog(null, "se ha registrado con exito");
    	} else {
    		JOptionPane.showMessageDialog(null,  "Ha ocurrido un error con " + error.substring(1) + "\n Numero de error: " +error.charAt(0));
    	}
    }

	public void initialize(URL location, ResourceBundle resources) {
		choiceEstadoSol.setItems(FXCollections.observableArrayList(obtenerDatosEstadoSol()));
		choiceTipoProducto.setItems(FXCollections.observableArrayList(obtenerDatosTipoSol()));
		choiceTipoSol.setItems(FXCollections.observableArrayList(obtenerDatosTipoProducto()));	
	}
	
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
	
	public String createSolicitud(String codigo, String estado, String descripcion, String clienteCedula, String codigoProducto, String fechaCreacion, String tipo,
			String nombre, String fechaNacimiento, String direccion, String telefono, String descripcionProducto, String tipoProducto, 
			int errorCodCliente, String errorNameCliente, int errorCodProducto, String errorNameProducto, int errorCodSolicitud, String errorNameSolicitud) {
		Connection con = null;
		CallableStatement cs = null;
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
			return errorCodSolicitud + errorNameSolicitud;
		} else {
			return "";
		}
	}
	
	private void cargarDriver() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.out.println("¡Oracle JDBC Driver no encontrado! " + e.getMessage());
		}
	}
	
}
