package com.bases.controllers;

import java.net.URL;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Types;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
    	String descripcion = textAreaDescripcionSol.getText();
    	String tipo = choiceTipoSol.getValue();
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
    	
    	createSolicitud(codigo, estado, descripcion, clienteCedula, codigoProducto, fechaCreacion, tipo, nombre, fechaNacimiento, direccion, telefono, descripcionProducto, tipoProducto, errorCodCliente, errorNameCliente, errorCodProducto, errorNameProducto, errorCodSolicitud, errorNameSolicitud);
    	
    	if (errorCodCliente == 0 && errorCodProducto == 0 && errorCodSolicitud == 0) {
    		JOptionPane.showMessageDialog(null, "se ha registrado con exito");
    	} else if (errorCodCliente != 0) {
    		JOptionPane.showMessageDialog(null,  errorNameCliente);
    		System.out.println("1"+errorCodCliente);
    	} else if (errorCodProducto != 0) {
    		JOptionPane.showMessageDialog(null, errorNameProducto);
    		System.out.println("2"+errorCodProducto);
    	} else if (errorCodSolicitud != 0) {
    		JOptionPane.showMessageDialog(null, errorNameSolicitud);
    		System.out.println("3"+errorCodSolicitud);
    	}
    }

	public void initialize(URL location, ResourceBundle resources) {
		choiceEstadoSol.setItems(FXCollections.observableArrayList("Pendiente", "Asignada"));
		choiceTipoProducto.setItems(FXCollections.observableArrayList("Telefonia", "Internet"));
		choiceTipoSol.setItems(FXCollections.observableArrayList("Solicitud", "Daño", "Reclamo"));	
	}
	
	public void showData() {
		
	}
	
	
	public void createSolicitud(String codigo, String estado, String descripcion, String clienteCedula, String codigoProducto, String fechaCreacion, String tipo, String nombre, String fechaNacimiento, String direccion, String telefono, String descripcionProducto, String tipoProducto, int errorCodCliente, String errorNameCliente, int errorCodProducto, String errorNameProducto, int errorCodSolicitud, String errorNameSolicitud) {
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
			System.out.println(cs.getInt(14) + "-" + cs.getString(15));
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
	}
	
	private void cargarDriver() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.out.println("¡Oracle JDBC Driver no encontrado! " + e.getMessage());
		}
	}
	
}
