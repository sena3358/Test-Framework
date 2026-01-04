package mg.teste;

import java.lang.reflect.Method;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.io.IOException;
import java.lang.ModuleLayer.Controller;
import java.lang.reflect.*;
import java.text.Annotation;
import java.util.List;

import com.monframework.annotation.*;
import com.monframework.finder.ClassFinder;

public class Main {
    public static void main(String[] args) throws ClassNotFoundException, IOException {

        // Class<?> clazz = Teste.class;
        // for (Method m : clazz.getDeclaredMethods()) {
        //    if (m.isAnnotationPresent(HandleUrl.class)) {
        //        HandleUrl ann = m.getAnnotation(HandleUrl.class);
        //        System.out.println("Méthode " + m.getName() + " gère l'URL : " + ann.value());
        //    }
        // }
        Class<?>[] classes = {
            Class.forName("mg.teste.Uno"),
            Class.forName("mg.teste.Dos"),
            Class.forName("mg.teste.Tres")
        };

        // for (Class<?> clazzs : classes) {
        //     if (clazzs.isAnnotationPresent(MyController.class)) {
        //         System.out.println("La class " + clazzs.getSimpleName() + " est un @MyController");
        //     }
        // }

        AnnotationUtils.checkAnnotation(classes, MyController.class);
        // AnnotationUtils.checkAnnotation(classes, MyController.class);

        Path classesRoot;
        if (args.length >= 1) {
            classesRoot = Paths.get(args[0]).toAbsolutePath();
        } else {
            // Avec Spring Boot, les classes compilées sont dans target/classes
            classesRoot = Paths.get("target/classes/").toAbsolutePath();
        }

        
        List<String> annotated = ClassFinder.findClassesAnnotatedWithControleur(classesRoot);
        if (annotated.isEmpty()) {
            System.out.println(" (none found)");
        } else {
            annotated.forEach(s -> System.out.println(" - " + s));
        }
    }
}