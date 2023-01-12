# A list of albums 
Request:
GET /albums

Expected response (200 OK)
A list of albums

# Find a specific album
Request, using dynamic parameter:
GET /albums/:id

Expected response (200 OK)
A specific album

# Create a new album
Request, using dynamic parameter:
POST /albums

With body parameters:
  title='Voyage'
  release_year='2022'
  artist_id='2'
  
Expected response (200 OK)
No content, just create new resource (new album)

# A list of artists 
Request:
GET /artists

Expected response (200 OK)
Pixies, ABBA, Taylor Swift, Nina Simone


# Creates a new artist in the database
Request:
POST /artists

With body parameters:
name=Wild nothing
genre=Indie

Expected response (200 OK)
(No content)

Then subsequent request:
GET /artists

Expected response (200 OK)
Pixies, ABBA, Taylor Swift, Nina Simone, Wild nothing
