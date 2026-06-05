use mouli;
CREATE TABLE user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL,
    user_email VARCHAR(100) UNIQUE NOT NULL,
    user_password VARCHAR(255) NOT NULL,
    user_phone VARCHAR(15),
    user_role ENUM('Admin','Organizer','Participant') DEFAULT 'Participant',
    user_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE events (
    event_id INT AUTO_INCREMENT PRIMARY KEY, 
    event_title VARCHAR(200) NOT NULL,
    event_description TEXT,
    event_date DATE NOT NULL,
    event_time TIME NOT NULL,
    event_venue VARCHAR(200) NOT NULL,
    event_organizer_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (event_organizer_id) 
    REFERENCES user(user_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE registrations (
    registration_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    event_id INT NOT NULL,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id)
        REFERENCES user(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (event_id)
        REFERENCES events(event_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

use mouli;
CREATE INDEX idx_user_email ON user(user_email);
CREATE INDEX idx_event_organizer ON events(event_organizer_id);
CREATE INDEX idx_registration_user ON registrations(user_id);
CREATE INDEX idx_registration_event ON registrations(event_id);





INSERT INTO user
(user_id, user_name, user_email, user_password, user_phone, user_role)
VALUES
(1, 'Admin User', 'admin@eventhub.com', 'hashed_password', '9876543210', 'Admin'),

(2, 'Ravi Kumar', 'ravi@gmail.com', 'hashed_password', '9876543211', 'Organizer'),

(3, 'Priya Sharma', 'priya@gmail.com', 'hashed_password', '9876543212', 'Organizer'),

(4, 'Arjun Reddy', 'arjun@gmail.com', 'hashed_password', '9876543213', 'Participant'),

(5, 'Sneha Patel', 'sneha@gmail.com', 'hashed_password', '9876543214', 'Participant'),

(6, 'Rahul Verma', 'rahul@gmail.com', 'hashed_password', '9876543215', 'Participant'),

(7, 'Kiran Kumar', 'kiran@gmail.com', 'hashed_password', '9876543216', 'Participant'),

(8, 'Anjali Gupta', 'anjali@gmail.com', 'hashed_password', '9876543217', 'Participant'); 

INSERT INTO events
(event_title, event_description, event_date, event_time, event_venue, event_organizer_id)
VALUES

('Tech Fest 2026',
 'Annual technology festival featuring coding contests and workshops',
 '2026-07-10',
 '10:00:00',
 'Hyderabad Convention Center',
 2),

('AI Workshop',
 'Hands-on workshop on Artificial Intelligence and Machine Learning',
 '2026-07-15',
 '09:30:00',
 'Vijayawada Tech Park',
 3),

('Startup Meetup',
 'Networking event for startups, investors and entrepreneurs',
 '2026-08-05',
 '11:00:00',
 'Visakhapatnam Innovation Hub',
 2),

('Photography Expo',
 'Photography exhibition and competition',
 '2026-08-20',
 '10:30:00',
 'Guntur Exhibition Hall',
 3),

('Cyber Security Summit',
 'Latest trends in cyber security and ethical hacking',
 '2026-09-02',
 '09:00:00',
 'Tirupati Tech Center',
 2),

('Cloud Computing Conference',
 'Conference focused on cloud technologies and DevOps',
 '2026-09-15',
 '10:00:00',
 'Amaravati Convention Hall',
 3),

('Data Science Bootcamp',
 'Intensive bootcamp on data science and analytics',
 '2026-10-01',
 '09:00:00',
 'Vizag Knowledge Park',
 2),

('Web Development Workshop',
 'Full stack web development training session',
 '2026-10-20',
 '11:00:00',
 'Hyderabad Innovation Hub',
 3); 

 INSERT INTO registrations
(user_id, event_id)
VALUES

(4,1),
(5,1),
(6,1),

(4,2),
(7,2),

(5,3),
(8,3),

(4,4),
(6,4),

(5,5),
(7,5),

(4,6),
(8,6),

(5,7),
(6,7),
(7,7),

(4,8),
(5,8),
(8,8);

select * from user; 
select * from events; 
select * from registrations; 