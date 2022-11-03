/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package logic;

import jakarta.servlet.http.Part;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

/**
 *
 * @author haimi
 */
public class SaveImage {

    public void saveiMage(Part part, String filename) throws IOException {
        Files.deleteIfExists(Paths.get("C:\\Users\\haimi\\Downloads\\quizPractice\\QuizPractice\\web\\img\\" + filename));
        part.write("C:\\Users\\haimi\\Downloads\\quizPractice\\QuizPractice\\web\\img\\" + filename);
    }
}
