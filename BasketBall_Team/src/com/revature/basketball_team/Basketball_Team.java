package com.revature.basketball_team;

import java.io.*;
import java.util.Scanner;

public class Basketball_Team {



    protected boolean isRunning = true;
    public void Register() {

        Scanner consoleReader = new Scanner(System.in);

        System.out.println("Please enter the following information to register: ");

        System.out.println("First Name: ");
        String firstName = consoleReader.nextLine();

        System.out.println("Last Name: ");
        String lastName = consoleReader.nextLine();

        System.out.println("Number: ");
        String number = consoleReader.nextLine();

        System.out.println("Position(Ex. C, SF, PF, PG, SG): ");
        String position = consoleReader.nextLine();

        System.out.println("Overall: ");
        String overall = consoleReader.nextLine();

        Basketball_Players newPlayer = new Basketball_Players(firstName, lastName, number, position, overall);

        System.out.println("You entered the following:\n" + "First Name: " + newPlayer.getFirstName() + "\n" + "Last Name: " + newPlayer.getLastName()
         + "\n" + "Number: " + newPlayer.getNumber() + "\n" + "Position: " + newPlayer.getPosition() + "\n" + newPlayer.getOverall());



        try(BufferedWriter writer = new BufferedWriter(new FileWriter("resources/players.csv"))) {
            writer.write(firstName + "," + lastName + "," + number + "," + position + "," + overall + "\n");
            System.out.println("Data successfully persisted to players.csv.");
        }
        catch(IOException e){
            System.err.println("Could not get access to resources/players.csv. No data persisted to file.");
            throw new ResourcePersistenceException();
        }
        catch(Exception e){
            System.out.println("Some unexpected exception occurred.");
        }



    }

    public void FindPlayer() {

        Scanner consoleReader = new Scanner(System.in);

        System.out.println("Please enter player information: ");

        System.out.println("First Name: ");
        String firstName = consoleReader.nextLine();

        System.out.println("Last Name: ");
        String lastName = consoleReader.nextLine();

        System.out.println("Position(Ex. C, SF, PF, PG, SG): ");
        String position = consoleReader.nextLine();


        try( BufferedReader reader = new BufferedReader(new FileReader("resources/players.csv"))){
            String line = reader.readLine();
            while (line != null) {

                if ( line.contains(firstName + "," + lastName) ) {
                    if ( line.contains(position)) {
                        System.out.println("Player successfully found!");
                        System.out.println("Welcome " + firstName);
                        System.out.println(line);
                        ExitApp();

                    } else {
                        System.out.println("Player not found! Please try again.");
                        FindPlayer();
                    }

                } else {
                    System.out.println("Player not found! Please try again.");
                    FindPlayer();
                }
                line = reader.readLine();
            }
        }
        catch(IOException e){
            System.err.println("Could not get access to resources/players.csv");
            throw new RuntimeException(e);
        }

    }

    public void ExitApp() {
        System.out.println("Exiting application...");
        isRunning = false;
    }

    public static void main(String[] args) {
        Scanner userInput= new Scanner(System.in);
        Basketball_Team roster = new Basketball_Team();

        System.out.println("Welcome to the Basketball Team Registration App!");

        System.out.println("Please select from the following options: \n1) Player Registration \n2) Find Player \n3) Exit ");

        String userSelection = userInput.nextLine();

        switch (userSelection) {
            case "1":
                roster.Register();
                break;

            case "2":
                roster.FindPlayer();
                break;

            case "3":
                roster.ExitApp();
                break;

            default:
                System.out.println("Invalid Selection. PLease select a corresponding value from the menu options.");
                System.out.println("Try again.");

        }




    }
}

