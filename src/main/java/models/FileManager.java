package models;

import java.io.*;

public class FileManager {
    private File file;

    public FileManager(File file) {
        this.file = file;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public void checkAndCreateFileIfDNE() {
        if (!file.exists()) {
            file.mkdirs();
        }
    }

    public void readOrWriteInTxt() throws IOException {
        try {
            FileReader fr = new FileReader(file + "\\logins.txt");
            System.out.println("File exists");
            fr.close();
        } catch (FileNotFoundException e ) {
            FileWriter fw = new FileWriter(file + "\\logins.txt");
            System.out.println("File created");
            fw.close();
        }
    }
}
