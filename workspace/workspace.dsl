workspace {
    name "Conference Kata"
    description "The software architecture of Neal Ford's Conference Kata."

    !adrs adrs
    !docs docs

    model {
        user = person "Attendee" "General attendee"
        organizer = person "Organizer" "Someone managing the system" {
            tags organizer
        }
        sponsor = person "Sponsor" "A Business person" {
            tags sponsor
        }
        speaker = person "Speaker" "Natural person submitting papers" {
            tags speaker
        }

        softwareSystem = softwareSystem "Conference System" "System desgin for Conference Management" {

            wepapp = container "Website" "Single page application" "React"{
                tags "website"
                website = component "Website" "Shows conference information such as speakers, talks and schedule" "React SPA"
            }

            confapp = container "Conference Application" "Conference Backend Application" Java {
                attendee = component "Attendee System" "System to manage attendee information, such as talks evaluation and access to slides" "Java"
                voting = component "Voting system" "Send and receives evaluation via web, email, SMS or phone calls" "Java"
                branding = component "Branding system" "Allow customization for several conference brands" "Java"
                ticket = component "Ticketing System" "Manages tickets sales and reservations" "Java"
                cfp = component "CFP" "Call for papers administration" "Java"
                crm = component "CRM" "Customer Relationship Management for sponsors" "Java"

                // Person interactions
                user -> website "Visits website" 
                organizer -> website "Customizes branding"
                speaker -> website "Sends CFP"
                crm -> sponsor "Send emails to" "Email"
                crm -> user "Send notifications to" "Email, sms"
                
                // Website interactions
                website -> branding "Pull branding information from" "Http rest API" 
                website -> attendee "Reads and writes information from " "Http rest API" 
                website -> voting "Sends requests and displays aggregation from" "Http rest API" 
                website -> cfp "Reads data from" "Http rest API" 
                website -> ticket "Reads ticket information from" "Http rest API" 
                website -> crm "Reads Sponsor info from" "Http rest API" 
            }                
                              
            database = container "Database" "" "Relational database schema" {
                tags Database
                attendeeDB = component "Attendee DB" "Relational DB for attendee" "Postgresql" {
                    tags Database
                }
                websiteDb = component "Website DB" "Stores Website information" "Postgresql"{
                    tags Database
                }
                brandingDB = component "Branding DB" "Stores information about branding" "Postgresql"{
                    tags Database
                }
                ticketDb = component "Ticket DB" "Manages Tickets information" "Postgresql"{
                    tags Database
                }
                cfpDB = component "CFP DB" "Stores speaker & talks information" "Postgresql"{
                    tags Database
                }
                
                cfp -> cfpDB "Reads from and writes to" "JDBC"
                ticket -> ticketDb "Reads and writes tickets info to" "JDBC"
                branding -> brandingDB "Reads and writes to" "JDBC"
                attendee -> attendeeDB "Reads and writes to" "JDBC"
                voting -> websiteDb "Reads from and writes to" "JDBC"
            }

        }
    }

    views {
        systemLandscape softwareSystem {
            title "Conference System Landscape"
            include *
        }

        container softwareSystem {
            title "Container view of software system"
            include *
        }

        component database {
            title "Container view of Database"
            include *
        }

        component confapp {
            title "Component view of Conference application"
            include *
        }

        styles {

            element "Database" {
                color #FFFFFF
                background #00aa00
            }
            element "speaker" {
                background #000000
                color #ffffff
            }

            element "organizer" {
                background #002454
                color #ffffff
            }
            element "sponsor" {
                background #FF0000
                color #ffffff
            }
            element "Database" {
                shape cylinder
            }
            element "website" {
                shape WebBrowser
            }
        }

        theme default
    }

}