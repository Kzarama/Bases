package bases.bases;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

/**
 * Aplicacion para el proyecto de el curso de bases de datos
 * ICESI
 */
public class App  extends Application {
	/**
	 * metodo que carga la interfaz de usuario
	 */
	@Override
	public void start(Stage primaryStage) throws Exception {
		Parent root = FXMLLoader.load(getClass().getResource("/views/Bases Proyect.fxml"));
		Scene scene = new Scene(root);
		primaryStage.setScene(scene);
		primaryStage.show();
	}
	/**
	 * metodo principal
	 * @param args
	 */
	public static void main(String[] args) {
		launch(args);
	}
	
}
