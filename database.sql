-- Tested in PostgreSQL 14.2
-- songs	500
-- albums	50
-- artists	10
-- orders	450
-- order_lines	600
-- customers	45
-- AVG 275

DROP TABLE IF EXISTS songs;
DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;
DROP TABLE IF EXISTS order_lines;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

DROP FUNCTION IF EXISTS song_name_randomizer;

CREATE TABLE customers (
  customer_id INT
    GENERATED ALWAYS AS IDENTITY
, fname       VARCHAR(100)
, sname       VARCHAR(100)
, country     VARCHAR(100)
, PRIMARY KEY (customer_id)
);

CREATE TABLE orders (
  order_id    INT
    GENERATED ALWAYS AS IDENTITY
, order_time  TIMESTAMP
    DEFAULT now()
, status      CHAR(1)
    NOT NULL
    CHECK (status IN ('i', 'p', 's', 'd', 'c', 'h', 'r'))
    -- i = in progress
    -- p = purchased
    -- s = sent
    -- d = delivered
    -- c = cancelled
    -- h = on hold
    -- r = refunded
, customer_id INT
, PRIMARY KEY (order_id)
, FOREIGN KEY (customer_id)
    REFERENCES customers (customer_id)
    ON UPDATE CASCADE
    ON DELETE SET NULL
);

CREATE TABLE artists (
  artist_id    INT
    GENERATED ALWAYS AS IDENTITY
, name         VARCHAR(255)
, active       BOOL
, founded_year INT
, PRIMARY KEY (artist_id)
);

CREATE TABLE albums (
  album_id     INT
    GENERATED ALWAYS AS IDENTITY
, name         VARCHAR(255)
, release_year INT
, genre        VARCHAR(100)
, available    BOOL
, artist_id    INT
, PRIMARY KEY (album_id)
, FOREIGN KEY (artist_id)
    REFERENCES artists (artist_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

CREATE TABLE order_lines (
  order_id INT
, album_id INT
, quantity INT
    CHECK (quantity > 0)
, PRIMARY KEY (order_id, album_id)
, FOREIGN KEY (order_id)
    REFERENCES orders (order_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
, FOREIGN KEY (album_id)
    REFERENCES albums (album_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

CREATE TABLE songs (
  song_id    INT
    GENERATED ALWAYS AS IDENTITY
, name       VARCHAR(255)
, position   INT
, length_sec INT
, album_id   INT
, artist_id  INT -- featured artist
, PRIMARY KEY (song_id)
, FOREIGN KEY (album_id)
    REFERENCES albums (album_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
, FOREIGN KEY (artist_id)
    REFERENCES artists (artist_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

-- Restart identities just in case:
TRUNCATE TABLE customers   RESTART IDENTITY CASCADE;
TRUNCATE TABLE orders      RESTART IDENTITY CASCADE;
TRUNCATE TABLE order_lines RESTART IDENTITY CASCADE;
TRUNCATE TABLE albums      RESTART IDENTITY CASCADE;
TRUNCATE TABLE artists     RESTART IDENTITY CASCADE;
TRUNCATE TABLE songs       RESTART IDENTITY CASCADE;


-- Data for customers:
WITH fnames AS (
  SELECT fname
  FROM (VALUES 
    (NULL)
  , ('Rene')
  , ('Vince')
  , ('Opal')
  , ('Keefe')
  , ('Heath')
  , ('Corbin')
  , ('Patrick')
  , ('Elva Jocelyn')
  , ('Jesselyn')
  , ('Guillema')
  , ('Harley')
  , ('Tris')
  , ('Norry')
  , ('Ahmed')
  , ('Sarajane')
  , ('Adelaide')
  , ('Janina')
  , ('Clemmie')
  , ('Bess')
  , ('Anthea')
  , ('Jamie')
  , ('Jehu')
  , ('Gayla')
  , ('Brenda')
  , ('Suki')
  , ('Brina')
  , ('Dulcia')
  , ('Harry')
  , ('Bobina')
  , ('Hartley')
  , ('Zeke')
  , ('Scott Francis')
  , ('Wayland')
  , ('Kimberley')
  , ('Lotta')
  , ('Lynn')
  , ('Gregor')
  , ('Ag')
  , ('Constantine')
  , ('Porter')
  , ('Hyacinthie')
  , ('Dill')
  , ('Quincey')
  , ('Felix')
  , ('Wini')
  , ('Jake')
  , ('Audrey')
  , ('Sigismund')
  , ('Daniella')
  ) AS t (fname)
)
,    snames AS (
  SELECT sname
  FROM (VALUES 
    (NULL)
  , ('Gallard')
  , ('Isakowicz')
  , ('Iacoboni')
  , ('McDunlevy')
  , ('Lammas')
  , ('Deathridge')
  , ('Crayden')
  , ('Xi')
  , ('Mehmet')
  , ('Jeandillou')
  , ('Byrne')
  , ('Jaquest')
  , ('Aleksankov')
  , ('Drummond')
  , ('Arrighetti')
  , ('Duckham')
  , ('Tallett')
  , ('Van Daalen')
  , ('Semper')
  , ('O''Malley')
  , ('Donner')
  , ('Shea')
  , ('Wahlgren')
  , ('Bough')
  , ('Giraux')
  , ('Keig')
  , ('Fielders')
  , ('Osburn')
  , ('McMenamie')
  ) AS t (sname)
)
,    countries AS (
  SELECT country
  FROM (VALUES
    (NULL)
  , ('United States')
  , ('England')
  , ('Ireland')
  , ('China')
  , ('Finland')
  , ('France')
  , ('Indonesia')
  , ('India')
  , ('Netherlands')
  ) AS t (country)
)
INSERT INTO customers (fname, sname, country) 
SELECT fnames.fname
      , snames.sname
      , countries.country
FROM    fnames
      , snames
      , countries
ORDER BY random()
LIMIT 45;

-- Data for orders:
-- TODO: refactor the check that there are customers without orders
WITH customer_ids AS (
  SELECT customer_id 
  FROM   customers
  WHERE  customer_id <>
    (SELECT AVG(customer_id)
    FROM customers)
)
,    status_codes AS (
  SELECT status
  FROM (VALUES
    ('i')
  , ('p')
  , ('s')
  , ('d')
  , ('c')
  , ('h')
  , ('r')
  ) AS t (status)
)
,    times AS (
  SELECT now()::timestamp +
          random() * (now()::timestamp -
                      now()::timestamp - INTERVAL '5 years') AS times
        , generate_series(1, 1000)
)
INSERT INTO orders (order_time, status, customer_id)
SELECT times.times
      , status_codes.status
      , customers.customer_id
FROM    customers
      , status_codes
      , times
ORDER BY random()
LIMIT 450;

-- Data for artists:
WITH artist_names AS (
  SELECT name
  FROM (VALUES
    ('The Tavern Swank') 
  , ('The Squid')
  , ('Aerosol Nominate')
  , ('Midian')
  , ('40 Kilotons')
  , ('Spring')
  , ('Full Full Full')
  , ('Clean Up Crew')
  , ('Flagship')
  , ('Supress')
  ) AS t (name)
)
,   bools AS (
  SELECT bool
  FROM (VALUES
    (True)
  , (False)
  ) AS t (bool)
)
,   founded_years AS (
  SELECT generate_series(EXTRACT(YEAR FROM now()) - 50
                       , EXTRACT(YEAR FROM now())) AS founded_year
)
INSERT INTO artists (name, active, founded_year)
SELECT  artist_names.name
      , bools.bool
	  , founded_years.founded_year
FROM    artist_names, bools, founded_years
ORDER BY random()
LIMIT 10;

-- Data for albums:
WITH album_names AS (
  SELECT name
  FROM (VALUES
  (NULL)
, ('Call of the Mastodon')
, ('Dimensions')
, ('Friend Or Foe')
, ('Muertos Vivos')
, ('Ordinary Day')
, ('Da Ghetto Psychic')
, ('Gin & Phonic')
, ('Pink World')
, ('Superinstrumental')
, ('I Need You')
, ('The Way Home')
, ('Placer & Castigo')
, ('Arrivederci')
, ('Dancing On The Ceiling')
, ('Outskirts')
, ('Cross Currents')
, ('Panjtan Ka Ghulam')
, ('Gold')
, ('Whatever Happened To Boredom?')
, ('1942-1952 Jimmy Wakely')
, ('All The Good Times')
, ('Un cafe_ setanta matins')
, ('Miss Machine')
, ('Sue Thompson - Her Very Best')
, ('Live')
, ('Strictly Confidential')
, ('The Real Twang Thang')
, ('Shake A Hand')
, ('Occasional Rain')
, ('The Emperor Falls')
, ('Best of The Shangri-Las')
, ('20 Of Her Best')
, ('Who Is Mike Jones?')
, ('Cracks')
, ('Pieces Of Time')
, ('The Palest Grey')
, ('A Match & Some Gasoline')
, ('Lo Mejor con La Orq. Broadway')
, ('Grown Man')
, ('A Bothered Mind')
, ('Greatest Hits')
, ('Etiquette')
, ('Ec8or')
, ('Too Much Too Soon')
, ('Bossa Nova Stories')
, ('Love_ Peace & Nappiness')
, ('Germicide')
, ('The Road To Hell Part 2')
, ('Vanguard Visionaries')
, ('Hometown 2001')
, ('Eat / Kiss: Music For The Films By Andy Warhol')
, ('The Ultimate Most Relaxing New Age Piano in the Universe')
, ('Classic Gold: Best of All')
, ('The Berzerker')
, ('Holy Roller Novocaine')
, ('White Trash ......')
, ('Murskapunkkia')
, ('The Man from Snowy River')
, ('One World One People')
, ('Tales Of Wonder')
, ('Waterbed Hev')
, ('The Best Of Both Worlds')
, ('Things Falling Apart')
, ('Your Funeral... My Trial (2009 Digital Remaster)')
, ('Oasis of Love')
, ('Yeah.  Well_ Anyway....')
, ('Un Titre de Toune')
, ('Live Inferno')
, ('Vendredi 13 - 1981')
, ('The Very Best Of')
, ('Country Lovers. Vol. 3')
, ('Affirmation')
, ('Lullabies To Paralyze')
, ('The Singles')
, ('What You Thought You Heard')
, ('15 Exitos Vol. 2 Flor Silvestre')
, ('Grim Prospects Remixes - Grim Prospects Will Never End')
, ('The Incredible Kai Winding Trombones')
, ('Staying on the Watch')
, ('Openbare Weg')
, ('Tip World Singles 2000')
, ('Praise Him...Live!')
, ('Spontanous Combustion')
, ('From All Sides')
, ('Maurice Chevalier  The Essential Collection Vol 1')
, ('Dave Pearce Best of the Dance Years 1988 - 1992')
, ('The Equinox')
, ('Feel Good All Over: Anthology 1970-1976')
, ('13th And Pine')
, ('Call Tyrone')
, ('Final Vinyl')
, ('Fifteen Poems By Dylan Thomas')
, ('The Early Tapes 1975-1976')
, ('Legacy')
, ('Louie Bluie Film Soundtrack')
, ('Donny Hathaway')
, ('Canciones De Amor De Miguel Gallardo')
, ('What up Detroit')
, ('Peterbilt Angel')
, ('Homemade Ice-Cream')
, ('White Feather')
, ('Can We Go Home Now')
, ('In North Carolina')
, ('Wintertime')
, ('Electropop')
, ('The Hit List')
, ('Underneath')
, ('99 Monkeys')
, ('Nothing Else Matters')
, ('A Tribute to The American Horse')
, ('Mis Momentos')
, ('Mish Mash_ Le Blues European: Musique Slave Et Klezmer')
, ('In this Life')
, ('Signify (Special Edition)')
, ('In Your Honor')
, ('Talk To Your Daughter')
, ('American Songbook - Bacharach')
, ('Scarcity')
, ('Fire')
, ('Hanging On (Premiere Performance Plus Track)')
, ('Grim Prospects Remixes - Prospects Are Getting Grimmer')
, ('Snowflakes')
, ('The Out Sound From Way In!')
, ('El Fuego De Dentro')
, ('No Control')
, ('Pentagrammaton')
, ('Pianissimo')
, ('Milan Milan')
, ('Auralux Reggae Showcase')
, ('Heaven')
, ('Up Above My Head')
, ('Pearl Jam')
, ('Take A Look')
, ('Crack The Skye')
, ('Behind The Blue')
, ('Matumago X Press')
, ('The Best of DJ Quik - Da Finale')
, ('LOOK (Original Motion Picture Soundtrack)')
, ('Relax')
, ('Joy In Our Hearts - The Gospel Side Of The Jordanaires')
, ('Enjoy!')
, ('A Nite On The Strip - Live')
, ('Boo-Tay')
, ('The Best Of Shelley Fabares [Digital Version]')
, ('In London_ In Love')
, ('Of My Times')
, ('Venus Envy')
, ('bFreddys Favorites: The Best of A Nightmare On Elm Street')
, ('Bitter Suites to Succubi')
, ('Manila Nights')
, ('Snapshot')
, ('End Of The Road - Single')
, ('7 Miles')
, ('Things Falling Apart')
, ('Leland Martin')
, ('For Screening Purposes Only')
, ('That Which Does Not Kill You...Can Only Make You Stronger : Three Way Split')
, ('Break The Night')
, ('Texas Songster')
, ('The Scott Wesley Brown Collection: A Library of 35 Favorite Songs')
, ('Time and Space')
, ('Death ... Is just the beginning Vol.4')
, ('Live In Tokyo')
, ('Dark Days In Paradise')
, ('Une petite pause')
, ('The B52s')
, ('Moments')
, ('Punk International')
, ('Forever')
, ('Breaks_ Beats & Blondes')
, ('Reiki - Spiritual Fitness_ Relaxation and Chakra Meditation')
, ('Peace At Last - EP')
, ('Alright_ Still (Deluxe)')
, ('Light Flight - The Anthology')
, ('This DJ')
, ('Miles To Miles')
, ('RoadKillOvercoat')
, ('Addressing The Nation With The Blues')
, ('Lagrimas Negras')
, ('Surprise')
, ('Apogee')
, ('Bone To Pick')
, ('Strictly Trucking')
, ('Music Of The Brazilian Masters')
, ('To Live Alone')
, ('PeeBoy EP')
, ('The Way West')
, ('Suburban')
, ('Hitzone 49')
, ('Time Will Tell')
, ('4 Day Tornado')
, ('Ao Vivo')
, ('The Altogether')
, ('Strength & Loyalty')
, ('Kivenkantaja')
, ('Live at the Grand Olympic Auditorium')
, ('Take One More Chance With Me')
, ('Revolutions Per Minute')
  ) AS t (name)
)
,    release_years AS (
  SELECT generate_series(EXTRACT(YEAR FROM now()) - 55
                       , EXTRACT(YEAR FROM now())) AS release_year
)
,    genres AS (
  SELECT genre
  FROM (VALUES
    (NULL)
  , ('Pop')
  , ('Rock')
  , ('Classic')
  , ('Oldies')
  , ('Jazz')
  , ('R&B')
  , ('Metal')
  ) AS t (genre)
)
,    availables AS (
  SELECT bool
  FROM (VALUES
    (True)
  , (False)
  ) AS t (bool)
)
,    artist_ids AS (
  SELECT artist_id, founded_year
  FROM   artists
)
INSERT INTO albums (name, release_year, genre, available, artist_id)
SELECT album_names.name
     , release_years.release_year
     , genres.genre
     , availables.bool
     , artist_ids.artist_id
FROM album_names
   , release_years
   , genres
   , availables
   , artist_ids 
WHERE release_years.release_year > artist_ids.founded_year
ORDER BY random() 
LIMIT 50;

-- Data for songs:
WITH positions AS (
  SELECT albums.album_id
         -- MAX songs per album:
       , generate_series(1, ROUND(random()::decimal * 20)) AS position
	     -- MAX length for song, MIN = 1 second
	   , ROUND(random()::decimal * 1000, 0) AS length
  FROM albums
)
INSERT INTO songs (album_id, position, length_sec)
    SELECT album_id
		 , position
		 , length
    FROM positions;

CREATE TABLE song_names (name TEXT);
INSERT INTO song_names VALUES
  ('Deep Sea Creature')
, ('Soul Deep')
, ('Something Girls')
, ('Face the Ashes')
, ('The Moon And I (Ordinary Day Album Version)')
, ('Keepin It Real (Skit)')
, ('Drop of Rain')
, ('Pink World')
, ('Insatiable (Instrumental Version)')
, ('Young Boy Blues')
, ('The Urgency (LP Version)')
, ('La Culpa')
, ('Auguri Cha Cha')
, ('Tonight Will Be Alright')
, ('Floating')
, ('High Tide')
, ('Sohna Nee Sohna Data')
, ('Caught In A Dream')
, ('Synthetic Dream')
, ('Broken-Down Merry-Go-Round')
, ('Kassie Jones')
, ('Setanta matins')
, ('Setting Fire to Sleeping Giants')
, ('James (Hold The Ladder Steady)')
, ('Made Like This (Live)')
, ('Superconfidential')
, ('I Think My Wife Is Running Around On Me (Taco Hell)')
, ('Crazy Mixed Up World')
, ('Do You Finally Need A Friend')
, ('The Emperor Falls')
, ('Twist and Shout')
, ('It Makes No Difference Now')
, ('Laws Patrolling (Album Version)')
, ('Midnight Swim')
, ('In A Subtle Way')
, ('Spin')
, ('Burning In The Aftermath')
, ('Sabor Guajiro')
, ('Human Cannonball')
, ('Glory Be')
, ('Crossfire')
, ('Nashville Parthenon')
, ('Cocain Ducks')
, ('Human Being')
, ('The More I See You')
, ('Certain Things We Do')
, ('Forming')
, ('Driving Home For Christmas')
, ('Spooks In Space')
, ('Too Much Saturn')
, ('Movement 4 [from Kiss] (Album Version)')
, ('Stream')
, ('Make Me Over')
, ('Deform (live)')
, ('Wicker Chair')
, ('Stickin In My Eye')
, ('Ota kiinni')
, ('Rosemary Recalls')
, ('Sudanese Dance')
, ('Where The Thunder Roars (Tales Of Wonder Album Version)')
, ('Wanna Be A Player')
, ('Panama (Remastered Album Version)')
, ('Metal')
, ('She Fell Away (2009 Digital Remaster)')
, ('Next Time')
, ('Complicate It')
, ('Monde De Fou')
, ('Opus a Satana (Part 2)')
, ('This Melody (Live)')
, ('You Feel Good All Over')
, ('Indian Love Call')
, ('You Can Still Be Free')
, ('I Never Came')
, ('Commercial Reign')
, ('Hourglass')
, ('Caricia Y Herida')
, ('Grim Prospects (Gross Prospects - Bad Trip Remix)')
, ('Mangos')
, ('A Distant Voice')
, ('Openbare Weg')
, ('President Johnson')
, ('Lead Me Lord')
, ('Spontanous Combustion')
, ('Choro')
, ('Ma Louise')
, ('I Want You (Forever)')
, ('Hate')
, ('Thank You Lord')
, ('How Can You Call That Beautiful (Stewkey Vocal)')
, ('Cheatin In The Next Room')
, ('Candy Man')
, ('I See The Boys Of Summer')
, ('Three Is a Crowd')
, ('On Bended Knee')
, ('My Four Reasons')
, ('Little Girl (LP Version)')
, ('Eternamente Amame')
, ('Come Over')
, ('Blue Taxi')
, ('I Want Love (Tween You & Me) (Album Version)')
, ('White Feather')
, ('Christlike Roche')
, ('You Rascal You')
, ('Sympathy')
, ('They Say (Album)')
, ('Crawl Before You Ball (Album Version)')
, ('Medicate Myself')
, ('Biding Her Time')
, ('More And More  (LP Version)')
, ('Cowboy Ways')
, ('Brasas Vivas')
, ('Kolomeyke')
, ('In This Life')
, ('Waiting')
, ('Hell')
, ('I Got Over It (Album Version)')
, ('One Less Bell To Answer')
, ('Sense And Trick')
, ('Fire (Oscar G Space Vocal Mix)')
, ('Hanging On (Medium Key Performance Track Without Background Vocals)')
, ('Grim Prospects (Version 2 Remix)')
, ('Christmas In Jamaica')
, ('Gossippo Perpetuo')
, ('2190 Dias Contigo')
, ('No Control')
, ('The Vitalized Shell')
, ('Mozart')
, ('Ciao Milan')
, ('Lend Me Your Chopper')
, ('Letter To Heaven')
, ('Heaven is Where The Heart Is')
, ('Inside Jo')
, ('Take A Look  (LP Version)')
, ('The Czar: Usurper/Escape/Martyr/Spiral (Album Version)')
, ('Bulgarian Dream')
, ('Amalgama')
, ('Born and Raised In Compton')
, ('Robbers Kill Cop')
, ('Relax')
, ('Sweet By And By')
, ('Orgofart')
, ('Bitch Is Back')
, ('Naked Albino')
, ('Johnny Loves Me (LP Version)')
, ('Dearly Beloved')
, ('The Look Of Love')
, ('Cooler Than You')
, ('Taryns Deepest Fear')
, ('Summer Dying Fast')
, ('Still')
, ('Snapshot')
, ('End Of The Road (Head Horny\x19s Remix)')
, ('7 Miles')
, ('The Frail')
, ('Stone Cold Fingers (Bonus Track)')
, ('Snowball')
, ('Drunk Alone')
, ('Charisma')
, ('Going Down Slow')
, ('All Rise')
, ('Everything Changes')
, ('Master Of Disharmony')
, ('(This Is Not A) Love Song (Live)')
, ('What Are We Here For')
, ('Une petite pause')
, ('Wig')
, ('Perasmena Mesanihta')
, ('God Save the Queen (Live)')
, ('Forever')
, ('Sun Is Shining')
, ('New Age')
, ('Have Yourself A Merry Little Christmas')
, ('U Killed It')
, ('Rain And Snow')
, ('Gerra De De')
, ('Voices On The Corner')
, ('(Bloody Paw On The) Kill Floor')
, ('I Wish My Mother Was Here')
, ('Inolvidable')
, ('Miracle')
, ('Witch Weed (Live)')
, ('Not Buried Deep Enough')
, ('Give Me 40 Acres (To Turn This Rig Around)')
, ('Ernesto Nazareth')
, ('The Cube (Live)')
, ('Get Back Down')
, ('Battle Of The Rosebud / Cries')
, ('Beyond the Light')
, ('Spaceman')
, ('')
, ('Big Stax/High Volts (Album Version)')
, ('It Goes On')
, ('Pecado De Amor')
, ('Illuminate')
, ('Never Forget Me')
, ('Ukkosenjumalan poika')
, ('Kick Out The Jams')
, ('Me And My Buddy')
, ('Amber Changing')
, ('Murder Academy')
, ('Hey Daddy')
, ('4 Sea Interludes Op. 33a: Storm')
, ('I Need You Now')
, ('Atmosphere Station')
, ('Walk Away')
, ('Shadows That Move')
, ('Smile')
, ('Mountains Of Mourne')
, ('Kite Live from Sydney')
, ('Loco (Crazy)')
, ('Ever Be')
, ('Oh Look Misery')
, ('Yesterdays')
, ('Go To Hell')
, ('Moon River - Original')
, ('Infidel')
, ('English Summer Rain')
, ('Spanish Shuffle (Album Version)')
, ('Intro')
, ('Empress So Divine')
, ('Terapia De Amor Intensiva')
, ('Haunting')
, ('Lies Of Hate')
, ('The First Noel')
, ('Musical Episode')
, ('Beautiful Brown eyes')
, ('Drop the Bass')
, ('The Last Word (Amended Version)')
, ('Hard Times')
, ('Just As Much As Ever')
, ('The Boss')
, ('Escapist')
, ('Someone to Watch Over Me')
, ('Pinned To The Ground (album version)')
, ('Always And Never (Album Version)')
, ('Myth Takes')
, ('Carpe PM')
, ('Who Shot Ya (Amended Album Version)')
, ('Poor Tom (Album Version)')
, ('Wounded Hearts')
, ('When Morning Comes To Town')
, ('Estate')
, ('Freedom Enough (From Silent Mother Nature)')
, ('Hai Shava')
, ('Nutty Block')
, ('Until You Love Someone')
, ('Part One From Triomusic')
, ('Hello Young Lovers (LP Version)')
, ('Same Man')
, ('Quiero Ir Ao Mar')
, ('The Owl and the Pussy-cat')
, ('Set You Free This Time')
, ('Bloco Da Solidao (1996 Digital Remaster)')
, ('Will You Love Me Tomorrow')
, ('Stille nacht_ heilige nacht')
, ('Nine Ways')
, ('Northern Downpour (Album Version)')
, ('Bad Seed')
, ('Exchange')
, ('Oh My God')
, ('Joy To The World')
, ('Hoochie Coochie Man')
, ('Ftei O Erotas')
, ('The Second Summer Of Love')
, ('Prelude And Fugue In C Major BWV 531 : Fugue')
, ('Give It What U Got')
, ('Dancing To A Standstill')
, ('Isla del Luna')
, ('Spirit')
, ('Another Long One')
, ('Leng Jing')
, ('OAKtown')
, ('Larger Than Life')
, ('I Hold Your Hand In Mine [Live At Royal Albert Hall]')
, ('Baby Come To Me')
, ('Den Pai Alo')
, ('It Wont Be Christmas')
, ('Knocked Out Of The Park')
, ('Salt In NYC')
, ('Wessex Loses a Bride')
, ('Erica (2005 Digital Remaster)')
, ('Blessed Assurance')
, ('Loaded Like A Gun')
, ('Rumba De Barcelona')
, ('Wild Rose (Back 2 Basics Mix)')
, ('Kutt Free (DJ Volume Remix)')
, ('Ten Tonne')
, ('A Higher Place (Album Version)')
, ('Sono andati? Fingevo di dormire')
, ('Got My Mojo Workin')
, ('Get Your Head Stuck On Your Neck')
, ('Jenny Take a Ride')
, ('Sonnerie lalaleul\xc3\xa9 hi houuu')
, ('Midnight Star')
, ('Native Soul')
, ('Der Kleine Dompfaff')
, ('A Whiter Shade Of Pale (Live @ Fillmore West)')
, ('The Ballad Of Sleeping Beauty')
, ('Music is what we love')
, ('City Slickers')
, ('Intro')
, ('Harajuku Girls')
, ('Prognosis')
, ('Living Hell')
, ('Small World')
, ('Truck Driving Man/Down In The Caribbean')
, ('Swallow The Knife (Live) (Segue)')
, ('Mayday')
, ('Lake Of Dreams')
, ('Because Of You')
, ('Rattlesnake!')
, ('Disappeared')
, ('Ghost Town Rituals (Album Version)')
, ('Morning Glory')
, ('Rudolph The Red-Nosed Reindeer')
, ('Tomorrow Gone')
, ('And I Love You So')
, ('Quiet Time')
, ('Little Sister')
, ('Song For Mom (LP Version)')
, ('All Over Me')
, ('I Hate You')
, ('From The Blind (LP Version)')
, ('Misanthrope')
, ('Chains Chains (Live In Hammersmith)')
, ('The Date (Remix By Ana Rago)')
, ('As My Fire Flies')
, ('We Wish You A Merry Christmas')
, ('Saturday Night Is The Loneliest Night In The Week')
, ('A Mi No Me Importa')
, ('BYOB (Explicit Album Version)')
, ('Brighton by the Sea')
, ('CHAOS INTRO')
, ('Hex Breaker')
, ('The Melting Moon (Edit)')
, ('Hawaiian Chimes')
, ('Turn Around')
, ('Tumba Tumba')
, ('Suffocating Under Words Of Sorrow (What Can I Do)')
, ('Deep Night/Softly As In A Morning Sunrise (Medley)')
, ('Let Me Show You [I Just Want To Make You Smile]')
, ('Monster For Music')
, ('Complain')
, ('Daydreaming [Jakwob Remix]')
, ('Ease')
, ('Everchanging')
, ('Too much informa')
, ('So Hot')
, ('Youlan_ Lonely Orchid (solo guqin)')
, ('Forbidden Fruit')
, ('Recorda-Me')
, ('Lady Of Your Calibre')
, ('Italian For Goodbye (skit)')
, ('Anti Geroi')
, ('Stronger Than Me')
, ('Only For The Young')
, ('Serene')
, ('So Jah Seh')
, ('Joy In The Journey (The Final Word Album Version)')
, ('Chorinho Pra Ele (Live)')
, ('bWarriors Quest')
, ('The Hustle')
, ('God Bless You (Goddamn it)')
, ('The Illusionist')
, ('La Route Est Belle')
, ('Urgence')
, ('Trapped In Reality')
, ('Our Darkest Days')
, ('Dumb Woman Blues')
, ('Letting You Back In')
, ('Hear Me Lord (2001 Digital Remaster)')
, ('Undertow')
, ('12 Seasons of Love')
, ('Courtyard')
, ('Have You Ever Seen The Rain')
, ('Cry Baby')
, ('Interlude')
, ('Terra')
, ('Mother')
, ('A La Memoria Del Muerto')
, ('My Bonnie Lies Over the Ocean')
, ('Now You Know')
, ('Sex Objekt')
, ('Rain / Ekoln')
, ('Reason With The Beast')
, ('As Diehard As They Come (Album Version)')
, ('No Unexpected Guests')
, ('Walls And Cannonballs (Album)')
, ('Trouble In The City')
, ('Dark Angel')
, ('Knocked Up')
, ('Ven Conmigo/Perdoname (Live)')
, ('Taste Of Dis (Explicit Version)')
, ('Prvni vesela')
, ('Librado Maldonado')
, ('Crass Commercialism')
, ('Flores Negras')
, ('Rollercoaster Ride')
, ('Turning Away')
, ('Metal from Hell...22nd Century')
, ('The Girl I Find (LP Version)')
, ('Panda Bear')
, ('Drifting From Town To Town')
, ('Negativ Song')
, ('The Lords Prayer')
, ('Nubia (LP Version)')
, ('Ojos Gitanos')
, ('Mira Nina')
, ('Solamente Una Vez')
, ('Zolte Slonie')
, ('Sahti Waari')
, ('Nina Nina')
, ('Only Do for Love')
, ('Arrival')
, ('Megatrend')
, ('In The Name of the Father')
, ('A Somber Wind from a Distant Shore (Album)')
, ('Little Timmy')
, ('Erica')
, ('Marcando El Ritmo Al Caminar')
, ('To Agalma')
, ('Damisela Encantadora')
, ('You Are My Memoir')
, ('Pienso En Ti')
, ('Bus Station Blues (Live)')
, ('Mr. Prime Minister')
, ('I Love You And You Love Me')
, ('A New Hope')
, ('Como La Flor (2005 Re-mastering) (Live)')
, ('Ponto')
, ('Great Is Thy Faithfulness')
, ('Party In The Burbs')
, ('Compulsory Resurrection')
, ('Lobotomy')
, ('The tears I cried')
, ('La Excursion')
, ('Big Balls And Cow Town')
, ('Into A Swan')
, ('To The Stars')
, ('The Joes Mobilize')
, ('I Got To Quit My Baby')
, ('So Unhappy')
, ('San Cristobal')
, ('Kashmiri Love Song')
, ('Ammonite')
, ('If I Ruled The World')
, ('The Sweep')
, ('I Love You')
, ('This Christmas (LP Version)')
, ('Curvy Cola Bottle Body')
, ('Alkohol')
, ('Heart it Races (Frank Tetaz Remix)')
, ('Very Well')
, ('Village Attack/ The Arrest')
, ('Lesson Learned')
, ('(I Heard That) Lonesome Whistle')
, ('Here Comes The Hotstepper')
, ('Almost Genuine')
, ('Es dificil')
, ('The Sweetest Curse')
, ('Talk Like POP')
, ('Fuego Caliente')
, ('Un Tipo Como Yo')
, ('The Thrill Is Gone')
, ('Slave To The Wage')
, ('Hit The Lights')
, ('Cancion Para Mi Muerte')
, ('Have You Seen Her')
, ('Lil Mama Getdown')
, ('Closing Scene')
, ('Get It For Free')
, ('Feelings')
, ('If You Love Me')
, ('Still There For Me')
, ('Allein')
, ('Crying Time')
, ('You Can Always Come Home')
, ('Little Bitty Pretty One')
, ('Shooting Stars')
, ('The Cookie Bakers of the Night')
, ('Whip It')
, ('The Blessing')
, ('Citizen Of The Planet')
, ('Love Me Now (Rockwilder Remix) (Feat. Wyclef And Redman)')
, ('Something For The Pain')
, ('Everyone_ Everywhere_ Everytime')
, ('This Is NOT a Crass Song')
, ('Soul Searcher')
, ('Skeletons (Live Acoustic Version)')
, ('Imagination')
, ('Flashflood')
, ('What To Do Crying Waiting Hoping Learning The Game')
, ('Old Times Sake')
, ('Wasted Love')
, ('Eleanor Put Your Boots On')
, ('Ass Attack (Four Tet Remix)')
, ('Canta Brasil')
, ('Sally In the Garden')
, ('Steamroller Blues')
, ('Heute')
, ('A Day In The Life (Album Version)')
, ('Sous la Tour Eiffel')
, ('Falling Bombs')
, ('Sometimes')
, ('Drive In Saturday - (Tribute to David Bowie)')
, ('My Life Would Suck Without You')
, ('Bed Crumbs')
, ('No More Blues (Chega de Saudade)')
, ('Wave')
, ('Time to come true')
, ('Winter (Four Seasons)')
, ('Hallelujah')
, ('Creeper Kamikaze')
, ('Error')
, ('Fausse monnaie')
, ('I Live to Be Hated')
, ('Siyabonga (Unreleased Bonus Track)')
, ('The Majesty Of Rock')
, ('Blaue Matrosen (live)')
, ('Strange Thing')
, ('Journey To Love')
, ('Alguna Vez')
, ('Rotting Fumes')
, ('Revelations')
, ('I Want It')
, ('Sajana (Ft Faheem Mazhar)')
, ('Segredo')
, ('Murder One')
, ('I Destructor (Lenny Dee Mix)')
, ('No Quieras Marcharte')
, ('D Shuffle Jam (Part 2)')
, ('When I Was A Cowboy (Western Plains) (LP Version)')
, ('On My Feet Again')
, ('If I...')
, ('Bedroom Acoustics')
, ('Ju Ju')
, ('Ad Te Clamamus Exsvles Mortva Liberi')
, ('Theresa')
, ('Danny Boy')
, ('Pak shte te obicham')
, ('Old Broom')
, ('Good Looking Girl Blues')
, ('Cajun Blood')
, ('Poikamies (2009)')
, ('Tell Me Why')
, ('Lullaby')
, ('Dance_ Gypsy_ Dance')
, ('Love Me')
, ('Good Loving')
, ('Trong Com')
, ('Doble Bombo')
, ('Mudhump')
, ('A Legend In My Time')
, ('Serve The Ego (Hani Num Dub)')
, ('Fall In Love [Rub A Dub Mix]')
, ('Going Home')
, ('Still In Love')
, ('Closed Eyes')
, ('Big Guys Throw Cones')
, ('Railroad Boogie')
, ('Sencillamente')
, ('Bury Your Head')
, ('American Journey/IV. Arts and Sports')
, ('Shuncata Penda')
, ('Melodica')
, ('Sailing')
, ('Slamka Spasa')
, ('Between Eunice & Opelousas')
, ('Monarchy Now')
, ('When Those Two Towers Fell')
, ('Shadow')
, ('Big Business')
, ('La Sitiera')
, ('Close Up')
, ('It Must Be')
, ('Bo Diddley')
, ('The Truth')
, ('Teenage Baby (Digitally Remastered)')
, ('So Many Books ... (The Word Album Version)')
, ('What Would You Do')
, ('Kong')
, ('Lotus Kiss')
, ('Intro')
, ('Church Hangover')
, ('The Ride (Album)')
, ('No Survivors')
, ('I Got Stripes (Live)')
, ('The Contracting Perception Of Consciousness')
, ('The Greed Of Our Stare')
, ('Same Old Song')
, ('Walk Away')
, ('Dem a Talk')
, ('Roger Milla (Stadium Mix)')
, ('La sangre de tu tristeza (con Dani Martin_ directo Enjoy 07)')
, ('Forever Consumed Oblivion')
, ('Irresistible! (Maurel & Fauvrelle LESS Mix)')
, ('Red Balloon')
, ('El Arte De Amar')
, ('Rio Grande Waltz')
, ('Honey I Sugar Pie')
, ('Phylyps Trak II/II')
, ('Stand By Your Man')
, ('Young Blood (2007 Digital Remaster)')
, ('Get Up & Go')
, ('Acension Final Chord Rising')
, ('Slimy Little Troll')
, ('Upon The Shores [Explicit]')
, ('De Kommissar 1')
, ('Hero In A Dream')
, ('Ji Xiang Yan Chu')
, ('Ice Cream Man')
, ('Crawling Up A Hill - version 2 - mono_ live')
, ('A Brazilian in New York')
, ('Mumbo Jumbo (jazz)')
, ('Walk With Me')
, ('Epilog')
, ('Get On Top (Album Version)')
, ('Moon Going Down')
, ('Raising Children')
, ('No seamos tontos')
, ('My First Day At School')
, ('Do You Ever Think Of Me')
, ('Everything You Touch Is a Song')
, ('De Tree Little Pigs')
, ('First Blood')
, ('Daughter Of Zion')
, ('Ni Gota De Rencor')
, ('Come To Find Out')
, ('56 Days')
, ('Victim Of Circumstance')
, ('Airheads')
, ('Bubblegum')
, ('Hungarian Dances_ WoO 1: No. 12 in D Minor: Presto')
, ('Colonel Brown (1999 Digital Remaster)')
, ('Heart Half Empty')
, ('The Flame')
, ('My Greatest Desire')
, ('Murderous Style')
, ('I Will Always Love You')
, ('The Truth Forever')
, ('The Tide Is High - Original')
, ('Music Reach (1/2/3/4) (Remastered)')
, ('He Put The Hurt On Me')
, ('Be Good To Me')
, ('Answer In The Question')
, ('Slip Out The Back (Album Version)')
, ('Lonesome Road (1995 Digital Remaster)')
, ('Ye That Tempteth_ Ye That Bequeth')
, ('Liquid Frequencies (liquid Soul Mix)')
, ('Banana Man')
, ('El Cara Bonita')
, ('Chocolate')
, ('Anillo de compromiso')
, ('New York (Dave Goodman Demo Version) (Explicit)')
, ('For Your Eyes Only')
, ('Welcome 2 Detroit')
, ('HISTORY')
, ('A Costa De Galicia')
, ('Enero en la playa (Edit)')
, ('Travel Song (Reprise)')
, ('Midnight In Memphis')
, ('Feelin You')
, ('This Time I Know')
, ('God Will Make A Way')
, ('bDont Leave')
, ('O Hiroteros Ehthros Mou')
, ('Spark')
, ('He Jiu Bi Hun')
, ('Destroy Babylon')
, ('Follow Your Dreams (The Plan Album Version)')
, ('Yippiyo-Ay')
, ('bYour God Isnt Listening')
, ('Talk About Us')
, ('Sosa (Explicit)')
, ('Der Wind Hat Mir Ein Lied Erz\xc3\xa4hlt (from La Habanera")"')
, ('Gangster Of Love')
, ('FRIENDS IN FALL RIVER  (LP Version)')
, ('bRoad Warriors Lament')
, ('Brother')
, ('Ascolta mio dio')
, ('Exaltation')
, ('Punchdrunk')
, ('Morena Boca De Ouro')
, ('bI Love You More Than Youll Ever Know (LP Version)')
, ('R\xc3\xa1pido Nos Vamos')
, ('El Mes Alt')
, ('Two Tickets To Paradise')
, ('Nun singet und seid froh')
, ('Shake Some Action')
, ('Smooth Operator')
, ('Red Orange Yellow')
, ('Biloxi')
, ('bSarah Yellin')
, ('Bullet Frenzy')
, ('Baby You Got What It Takes - Original')
, ('Zalozniy')
, ('Fernando')
, ('Machine Gun Majesty [Live] (Album Version)')
, ('Sentimentos Desiguais')
, ('Rastafari Prophecy')
, ('Alimony')
, ('Adeste fideles')
, ('Killing')
, ('This This (LP Version)')
, ('On The Brink')
, ('Consuelate Como Yo')
, ('Half The Fun')
, ('Damit Du Dich in mich verliebst')
, ('Drive By Music')
, ('Que Cosas_ Que Cosas')
, ('Ruby D.')
, ('Bounce Back')
, ('Empty Arms')
, ('Hey Joe')
, ('Fall Away Into Darkness')
, ('Neon Rainbow')
, ('Blues')
, ('Risen From Within')
, ('Humppa')
, ('winning friends')
, ('bIt Has Been A Long Time_ Hasnt It')
, ('Glo-Billy-Vee-Vee')
, ('You Are God (Broken Album Version)')
, ('XI GUAN LIANG GE REN')
, ('Crimson And Clover')
, ('Outro Duction')
, ('Barrage')
, ('Adios...Borron Y Cuenta Nueva')
, ('San Xuan')
, ('A Hard Road')
, ('Oh Oh Oh Baby')
, ('bIsnt That Just Like God (Low Key Performance Track Without Background Vocals)')
, ('Laughed At The Judge')
, ('Mele Wich Ayee (Shaan Remix)')
, ('Christina Christina Blues')
, ('Faithful and True (Collectors Version)')
, ('Le Zoo De Vincennes')
, ('Pass Through My Will')
, ('bDont Go Knockin On My Door')
, ('Sacrifice for the Slaughtergod')
, ('Si No Te Hubieras Ido')
, ('Cold Blood (LP Version)')
, ('Wanikaa (Featuring Abramz_ Krazy_ Lyrical G_ Saint Ca and Sylvester)')
, ('I Worship You')
, ('Lunes Por La Madrugada')
, ('Jimi Baby')
, ('Full Of Voices')
, ('More Where That Came From - Original')
, ('Fool For Your Loving')
, ('If I Run')
, ('bMaybe Im Crazy (Single original version_ 2008 Digital Remaster)')
, ('Heart Of The City (Soul and R&B)')
, ('Guardian Angel')
, ('Melodioso')
, ('Hel Vete')
, ('Escuchame')
, ('Sending A Message')
, ('Auf Der Mundharmonika')
, ('Girls Girls')
, ('6 6 6')
, ('bSomethings Missing')
, ('Dornr\xc3\xb6schen war ein sch\xc3\xb6nes Kind - Karaoke')
, ('Wiggle (Soul and R&B)')
, ('Maloba pamba')
, ('Weight Of The World (Album Version)')
, ('Judge Boushay Blues')
, ('Sabotage')
, ('My Heart Went That-A-Way')
, ('The Epi-Pen')
, ('Baat Ban Jaye')
, ('People of cloud nine')
, ('Away In A Manger')
, ('Mas P** (AmericaS Mexican)')
, ('Shang Zhui Ren')
, ('Loba')
, ('Pacific Coast Remix')
, ('bComplainin')
, ('Nordcore')
, ('Big Train')
, ('The Prayer - Feat. T.O. & Timberly K. Simmons')
, ('Rock the Spot')
, ('You Say Keep It Gangsta')
, ('bPop A Cap In Yo Ass')
, ('Swing Swang')
, ('Use Me')
, ('Gib deinem Herzen ein Zeichen (Radio Mix)')
, ('So. Central Rain (2006 Digital Remaster)')
, ('El Corcovado (The Wood-Quail)')
, ('The Portrait (Live) (Reissue) (Album Version)')
, ('Destination Eschaton (Hardfloor Vocal Mix)')
, ('In De Dance Again')
, ('Aquel Mundo De Amor')
, ('Living Underground')
, ('Chinoiserie')
, ('Perfect Tree')
, ('Careful In Career')
, ('bIm in Korea')
, ('Oedipus Rex_ Atto Secondo: Divum Jocastae Caput Mortuum (Messaggero_ Coro) (Stravinsky)')
, ('bDont Stop The Music')
, ('De pie')
, ('Disease')
, ('Roll Back The Rug')
, ('Money Money Money')
, ('Free (Album Version)')
, ('Jealousy')
, ('Ready To Go')
, ('Mama Kin')
, ('Bust At You [featuring Baby_ Scarface & Tony Sunshine] (edited album version)')
, ('Searching For Home')
, ('Reg mich nicht auf_ Johanna')
, ('The Reason I Go On')
, ('Where Were You Last Night')
, ('Cicada')
, ('The End Of The Line')
, ('LA River (Acoustic)')
, ('Inner City Blues (Alternate Mix) (Bonus Track)')
, ('Empire Falls')
, ('Right to Work (Live)')
, ('Princess Black')
, ('Bolero Militar')
, ('Rice Dream Girl')
, ('No more going home')
, ('Time After Time')
, ('Misty Mountains')
, ('All I Ever Really Wanted')
, ('Brand New Broken Heart')
, ('Te quiero tanto')
, ('Yesterdays')
, ('Mi Sangre Latino')
, ('Vincent')
, ('the fallen...')
, ('The Lifestyle That Got Away')
, ('Get Your Hustle On')
, ('Future Prospects')
, ('Skinhead on the MBTA (Album Version)')
, ('Love Attack')
, ('Above Lucium (LP Version)')
, ('Human Guinea Pig')
, ('Wink Of An Eye')
, ('Awesome God')
, ('Naked')
, ('Le temps des cerises')
, ('Loud And Clear')
, ('Freeze')
, ('Alli Mia Fora')
, ('Lydia [Piano Version]')
, ('Dress Me Up')
, ('Wo bleibt die Mark?')
, ('Love Thing')
, ('Bean Fields (Live) (2001 Digital Remaster)')
, ('Naked In The Rain (Album Version)')
, ('Who Are You?')
, ('There Are Things I Think You Should Know')
, ('The One I Got')
, ('Shake')
, ('Triesteitaliana')
, ('Thug Queen')
, ('Give Your Love To Me')
, ('Tides Of Time')
, ('So What!')
, ('Down On The Farm (2006 Remastered Edit Version)')
, ('Two Track Dub (Dub / Instrumental Reggae Music)')
, ('Papel Quemado')
, ('Romantic Rights')
, ('If Ever')
, ('Left To Starve')
, ('Lekeitio')
, ('The Wedding Samba')
, ('Stairs To the Attic')
, ('Prelude And Fugue In C Major BWV 545 : Prelude')
, ('The Love We Had Version')
, ('Vortex')
, ('Uncle Interlude')
, ('The Dynamo Of Volition [From An All Night Session]')
, ('Gold Und Silber')
, ('Guidum')
, ('Cavasamba Um (Edit)')
, ('All Kind of People')
, ('Hole In The Pumpkin')
, ('Between Me & You Kid (Album Version)')
, ('bThe One Ive Been Waiting For (Diamond Days Album Version)')
, ('Untitled')
, ('Una na na')
, ('bCant Break This Man')
, ('The Ambush')
, ('Play That Beat')
, ('bBerties Pets (Bonus Material)')
, ('Marilyn')
, ('Bladecrash Electrocution')
, ('Come Here Feat. Jay Sean')
, ('Through The Wire')
, ('El Aranero')
, ('Mash Up Mi Life')
, ('Old Friends')
, ('South Side Story')
, ('In His Presence (LP Version)')
, ('Space Between Us (Album Version)')
, ('Drifting Away')
, ('Position')
, ('Beyond Forever (2004 Digital Remaster)')
, ('Raga Anandi Kalyan (Alap_ jor and jhala)')
, ('Tetrispack')
, ('bNice N Easy')
, ('Doing Time (Album Version)')
, ('Night Train (Album Version)')
, ('Sunny Came Home')
, ('Short On Ideas / One Last Cigarette')
, ('Got It Twisted')
, ('Liverpoolin pokia')
, ('Stand')
, ('Caroline')
, ('Have Thine Own Way Lord')
, ('bIm The Man (Explicit) (Feat. Jeru The Damaja And Lil Dap)')
, ('The Door')
, ('CNN War Theme')
, ('Now We Know')
, ('Heart-Shaped Box')
, ('Girls Make My Hair Loose')
, ('Spaced Invader (Ian Pooley Club Mix)')
, ('Down At The Old Corral (Album Version)')
, ('Tien An Man Dream Again')
, ('Nasty Little Lonely')
, ('Tell Me Partner')
, ('Nonfiction')
, ('Money Make The World Go Around')
, ('Never Be Ready')
, ('Unlove Me')
, ('If I Know You')
, ('Smoke Screen')
, ('Ouverture')
, ('Up To Zion (High Key-Premiere Performance Plus w/o Background Vocals)')
, ('Solid Gold (Evolution Mix) (2005 Digital Remaster)')
, ('Only One You')
, ('Iron Man')
, ('Please Remember Me')
, ('Brazil Mon Amour')
, ('Honey')
, ('Mad World (Money-G. Remix)')
, ('Take Your Time feat. Yannick Noah')
, ('Innizar')
, ('bEmbraceable You (LP Version from When The Boys Meet The Girls)')
, ('Bass Pro Shop & Wal-Mart')
, ('Penny In My Pocket')
, ('Nadine')
, ('bMaries Wedding')
, ('I Love To Tell The Story  (Love To Tell The Story Album Version)')
, ('Queen Ida Introduction')
, ('Round Two Wrap-Up')
, ('Suicidal Dream')
, ('New York')
, ('Do It All Over Again')
, ('She Came Along To Me (LP Version)')
, ('Extrication Love Song')
, ('Skincree')
, ('Dis moi')
, ('Under World Du')
, ('Lil Stuntin')
, ('Diss Location')
, ('Did It Again (featuring Kid Cudi)')
, ('Persiana Americana (Live)')
, ('Recht auf Lungenkrebs')
, ('Pardesi Pind Wich Ageya')
, ('Tra-La-La Musette')
, ('Past Meets Present')
, ('KORITSU HOSPITAL')
, ('Squarebiz')
, ('Someday (Immune Album Version)')
, ('You Called It Madness [But I Call It Love] [Live At Royal Albert Hall]')
, ('Drugs')
, ('Scientas')
, ('The Painter And The Magician')
, ('Spanish Harlem')
, ('bPortrait Of Clare (from Portrait Of Clare)')
, ('The Hammer Song (2010 Digital Remaster)')
, ('Broadway Star')
, ('You Need Hands (1993 Digital Remaster)')
, ('All That You Need')
, ('Hope Ill Join That Band')
, ('Conscience Ah Heng Dem (interlude)')
, ('Sicilienne')
, ('Innocence')
, ('Gimme Gimme Song')
, ('Severed (demo) (Album Version)')
, ('Abnormal (Acoustic)')
, ('Redwing')
, ('Nur eine Nacht mit Dir')
, ('Heal (The Separation) [H.E.L.P Breakbeat]')
, ('Worrying Over You')
, ('Long Summer Days')
, ('Winter Wonderland')
, ('Luna de miel en Guama')
, ('Heart Of Dixie')
, ('Coven In Charing Cross')
, ('Obsidian Sunrise')
, ('Junco Partner')
, ('To Sinnefo')
, ('You Are The One')
, ('Raketen')
, ('Shut Your Eyes')
, ('Close To Me');

CREATE FUNCTION song_name_randomizer()
    RETURNS TEXT
    VOLATILE
    LANGUAGE SQL
  AS
  $$
    SELECT   name
	FROM     song_names
	ORDER BY random()
	LIMIT    1;
  $$;
  
CREATE FUNCTION feat_artist_randomizer()
    RETURNS INTEGER
    VOLATILE
    LANGUAGE SQL
  AS
  $$
    SELECT   artist_id
	FROM     artists
	ORDER BY random()
	LIMIT    1;
  $$;

UPDATE songs
SET    name = song_name_randomizer();

UPDATE songs
SET    artist_id = feat_artist_randomizer()
WHERE  song_id % ROUND((random()::decimal + 1) * 10)::integer = 2;

-- Clean up:
DROP TABLE song_names;
DROP FUNCTION song_name_randomizer();
DROP FUNCTION feat_artist_randomizer();

-- Data for order_lines:
WITH order_ids AS (
  SELECT order_id
  FROM   orders
)
,    album_ids AS (
  SELECT album_id
  FROM   albums
)
,    quantities AS (
  SELECT generate_series(1, 8) AS quantity
)
INSERT INTO order_lines (order_id, album_id, quantity)
  SELECT order_ids.order_id
       , album_ids.album_id
	   , quantities.quantity
  FROM order_ids
     , album_ids
	 , quantities
  ORDER BY random()
  LIMIT 600
ON CONFLICT (order_id, album_id) DO NOTHING;







