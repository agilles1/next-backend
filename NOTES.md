# NEXT 

An orchestra audition management app

## Models

- Audition
    - :date - datetime
    - :instrument - string
    -has_many: Candidates & Rooms

- Candidates
    - Name
    - Email 
    - Phone
    - Number (generated?)
    - belongs_to: Audition
    - has_many: Rooms, through: CandidatesRooms

- Rooms
    - Order
    - Name (text "255," "Green Room", "Stage", etc.) 
    - belongs_to: Audition
    - has_many Candidates, through: CandidatesRooms

- CandidatesRooms
    - belongs_to: Candidates, Rooms

## User Experience

**Step 1:** Create A new Audition form (checkbox for greenroom? holding room?)
**Step 2:** Check-in candidates (auto assign number and room based on availability?) 
**Step 3:** Manage the movement between holding room, warm-up space, on-deck, stage, end



