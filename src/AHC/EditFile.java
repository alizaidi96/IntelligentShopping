package AHC;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

public class EditFile {

    public static String path = "D:\\workspace\\AdvancedRecommendation\\src\\AHC\\te";

    public static void writer(ArrayList<String> dataset) {

        try {
            String data = null;
            File file = new File(path);
            file.createNewFile();
            FileWriter fw = new FileWriter(file);
            BufferedWriter bw = new BufferedWriter(fw);
            for (int i = 0; i < dataset.size(); i++) {
                if (i == 0) {
                    data = dataset.get(i);
                } else {
                    data = data + "\n" + dataset.get(i);
                }
            }

            bw.write(data);
            bw.flush();
            bw.close();

        } catch (IOException e) {
        }
    }
}
