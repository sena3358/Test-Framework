package mg.teste;

import com.monframework.annotation.HandleUrl;
import com.monframework.annotation.MyController;
import com.monframework.core.ModelView;
import com.monframework.annotation.POST;
import com.monframework.annotation.GET;
import com.monframework.annotation.Json;
import com.monframework.annotation.RequestParam;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@MyController("/upload")
public class FileUploadController {

    /**
     * Affiche le formulaire d'upload
     */
    @GET
    @HandleUrl("/form")
    public ModelView showUploadForm() {
        ModelView mv = new ModelView("/file/upload-form.jsp");
        return mv;
    }

    /**
     * Exemple 1: Upload simple avec extraction du nom de fichier
     * La clé est au format "fieldName:originalFileName"
     */
    @POST
    @HandleUrl("/simple")
    public ModelView uploadSimple(Map<String, byte[]> files) {
        ModelView mv = new ModelView("/file/upload-result.jsp");
        Map<String, String> fileInfos = new HashMap<>();
        
        for (Map.Entry<String, byte[]> entry : files.entrySet()) {
            String compositeKey = entry.getKey();
            byte[] data = entry.getValue();
            
            // Parser la clé composite "fieldName:originalFileName"
            String[] parts = compositeKey.split(":", 2);
            String fieldName = parts[0];
            String originalFileName = parts.length > 1 ? parts[1] : "unknown";
            
            // Extraire l'extension du fichier
            String extension = "";
            int lastDot = originalFileName.lastIndexOf('.');
            if (lastDot > 0) {
                extension = originalFileName.substring(lastDot);
            }
            
            fileInfos.put(fieldName, 
                "Nom: " + originalFileName + ", Extension: " + extension + ", Taille: " + data.length + " bytes");
        }
        
        mv.addObject("fileInfos", fileInfos);
        mv.addObject("message", "Fichiers uploadés avec succès!");
        return mv;
    }

    /**
     * Exemple 2: Upload et sauvegarde sur le disque avec l'extension originale
     */
    @POST
    @HandleUrl("/save")
    public ModelView uploadAndSave(Map<String, byte[]> files) {
        ModelView mv = new ModelView("/file/upload-result.jsp");
        Map<String, String> savedFiles = new HashMap<>();
        
        // Dossier de destination (créer si n'existe pas)
        String uploadDir = "C:/uploads/";
        File dir = new File(uploadDir);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        
        for (Map.Entry<String, byte[]> entry : files.entrySet()) {
            String compositeKey = entry.getKey();
            byte[] data = entry.getValue();
            
            // Parser la clé pour obtenir le nom original
            String[] parts = compositeKey.split(":", 2);
            String fieldName = parts[0];
            String originalFileName = parts.length > 1 ? parts[1] : "file";
            
            // Sauvegarder avec le nom original
            File outputFile = new File(dir, originalFileName);
            try (FileOutputStream fos = new FileOutputStream(outputFile)) {
                fos.write(data);
                savedFiles.put(fieldName, "Sauvegardé: " + outputFile.getAbsolutePath());
            } catch (IOException e) {
                savedFiles.put(fieldName, "Erreur: " + e.getMessage());
            }
        }
        
        mv.addObject("fileInfos", savedFiles);
        mv.addObject("message", "Fichiers sauvegardés dans: " + uploadDir);
        return mv;
    }
}
