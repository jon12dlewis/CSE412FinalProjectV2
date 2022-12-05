--
-- PostgreSQL database dump
--

-- Dumped from database version 15.0
-- Dumped by pg_dump version 15.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    c_id integer NOT NULL,
    rev_id integer,
    res_id integer,
    c_name character varying(225),
    c_age integer,
    c_address character varying(225),
    c_email character varying(225),
    c_phone character varying(225)
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: dine_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dine_table (
    t_id integer NOT NULL,
    r_id integer NOT NULL,
    max_seats integer,
    reserved boolean
);


ALTER TABLE public.dine_table OWNER TO postgres;

--
-- Name: reservation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservation (
    res_id integer NOT NULL,
    t_id integer NOT NULL,
    res_date character varying(225),
    res_size integer
);


ALTER TABLE public.reservation OWNER TO postgres;

--
-- Name: restaurant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restaurant (
    r_id integer NOT NULL,
    r_name character varying(225),
    r_address character varying(225),
    r_description character varying(225),
    r_phone character varying(225),
    r_rating integer,
    r_image character varying(225)
);


ALTER TABLE public.restaurant OWNER TO postgres;

--
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    rev_id integer NOT NULL,
    r_id integer NOT NULL,
    rev_text character varying(225),
    rev_date character varying(225),
    rev_rating character varying(225),
    name character varying(250)
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (c_id, rev_id, res_id, c_name, c_age, c_address, c_email, c_phone) FROM stdin;
10002	38464	9382	Jeanne Freeman	53	8757 Bridge Street	jfree22@gmail.com	585-261-6531
10003	38465	9383	Hajrah Stanley	43	5 Ridgewood St.	stanleyh@gmail.com	347-359-3741
10004	38466	9384	Preston Delacruz	28	89 W. Glendale Ave.	prescruzy@gmail.com	347-839-1788
10005	38467	9385	Gino Stephens	48	9391 Sage Dr.	gstephens@gmail.com	517-417-1472
10006	38468	9386	Zaydan Bean	39	701 Rockwell St.	butterbean@gmail.com	781-277-6061
10007	38469	\N	Akash Finch	24	12 Piper Street	afinch@gmail.com	216-551-1945
10008	38470	\N	Aniqa Wilder	29	7 Somerset Road	aniqaw3@gmail.com	703-357-9780
10009	38471	\N	Eileen Barr	41	7176 Silver Spear Dr.	ebarr123@gmail.com	970-428-1621
10010	38472	9390	Maxine Heaton	22	92 Race St.	mheaton11@gmail.com	205-447-0360
10011	38473	\N	Moshe Delarosa	15	510 Indian Spring Drive	rosadays@gmail.com	630-821-0858
10012	38474	9392	Archie Brandt	27	437 Lyme Road	archbr9@gmail.com	513-956-0619
10013	\N	9393	Killian Keeling	18	7220 Court Lane	kkeeling@gmail.com	775-941-6154
10014	\N	\N	Jeremy Sumner	20	15 State Dr.	jerrysum5@gmail.com	260-267-6414
10015	\N	9395	Raj Rosario	62	785 North Wentworth Street	rajrosario@gmail.com	703-203-3034
10016	\N	9396	Ben Stevenson	37	243 Westwood Ave	bensteve@gmail.com	250-257-0923
10017	\N	\N	Helen Cassa	22	92835 El Camino Blvd	hcassa@gmail.com	902-382-5756
10018	\N	9398	Alexandra Kirsch	19	395 Alhambra Blvd	alexakr6@gmail.com	528-896-9812
10020	\N	\N	James Charlie	56	6137 Bird Ave	jamiecharlie@gmail.com	257-589-9002
10001	38463	9381	Falak Deleon	19	9999 Country Club Lane	random@gmail.com	516-805-7959
10021	\N	\N	Robert Pew	69	3242 Drewy Lane	fhdje@gmail.com	432-534-5433
10022	\N	\N	Robert Pew	69	3674 Drewy Road	fhdheu@gmail.com	348-423-5345
68223	\N	281280	Mai Hung	43	7223 N 22nd Dr	mhung4258@gmail.com	6025459397
389017	\N	136576	Blue Bird	23	4332 fdsf 4323	mhhh@hdf.com	394858394
382011	\N	35917	Mai Hung	123	7223 N 22nd Dr	mhung4258@gmail.com	6025459397
376940	\N	232506	\N	\N	\N	\N	\N
373260	\N	371543	DODO	36	30 Tallwood Dr. New Castle, PA 16101	asdflasd	234-343-2343
490127	\N	322290	Timothy Moon	23	 9 Maple Ave. Middle River, MD 21220	tmoon2@gmail.com	234-435-3242
279095	\N	369786	Bob bob	23	mmjfjfu	sdafsdaf@gmail.com	434-433-2332
155108	\N	188079	Daniel Man	23	afjdj 22nd dr	jfkdkk@gmail.com	234-345-3234
224122	\N	15550	Moon 	23	asdfsdfasdf	kjkfhdh@gmail.com	234-344-2343
49428	\N	150486	sdfsdf	23423	asdfasdfasdfasdfasdf	asdfsadfsad	24234234
427042	\N	110838	Geaoge Gie	23	7364 N somwehere	gg.gmail.com	435-434-3553
136768	\N	31052	asdfsdafasd	34234	asdfsadf	asdafasdf	2334234
449250	\N	289384	tommy top	23	anywhere somewhere	jfidfj@gmail.com	234-342-3433
\.


--
-- Data for Name: dine_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dine_table (t_id, r_id, max_seats, reserved) FROM stdin;
101	86433	6	t
102	86433	6	t
103	86433	6	t
104	86433	6	f
105	86433	8	f
106	86433	8	f
107	86433	8	t
108	86433	8	t
109	86433	4	f
110	86433	4	f
111	86433	4	t
112	86433	4	f
113	86435	12	f
114	86435	12	f
115	86435	4	f
116	86435	4	f
117	86435	8	f
118	86435	8	t
119	86435	4	t
120	86435	4	t
121	86435	4	t
122	86435	8	t
123	86435	8	f
124	86435	8	f
125	86435	12	f
126	86435	12	t
127	86435	12	t
128	86435	8	f
129	86435	8	f
130	86435	8	f
131	86435	8	t
132	86435	4	t
133	86436	4	f
134	86436	4	f
135	86436	4	t
136	86436	4	t
137	86436	4	t
138	86436	4	f
139	86436	2	t
140	86436	2	t
141	86436	2	t
142	86436	4	f
143	86436	4	f
144	86436	4	f
145	86436	4	t
146	86436	4	t
147	86436	2	f
148	86436	2	t
149	86436	8	t
150	86436	8	f
151	86436	8	t
152	86436	8	t
153	86436	6	f
154	86438	6	t
155	86438	6	f
156	86438	6	f
157	86438	10	t
158	86438	10	t
159	86438	10	f
160	86438	10	t
161	86438	10	t
162	86438	10	t
163	86438	4	t
164	86438	4	f
165	86438	4	t
166	86438	4	t
167	86438	4	t
168	86439	6	t
169	86439	6	t
170	86439	6	t
171	86439	6	t
172	86439	6	t
173	86439	6	f
174	86439	2	t
175	86439	2	t
176	86439	2	t
177	86439	2	t
178	86439	8	f
179	86439	8	t
180	86439	8	f
181	86439	8	t
182	86439	8	t
183	86439	8	t
184	86439	8	f
185	86440	8	f
186	86440	4	t
187	86440	4	t
188	86440	4	f
189	86440	4	t
190	86440	4	t
191	86440	4	t
192	86440	4	t
193	86440	4	f
194	86440	4	t
195	86440	4	f
196	86440	4	f
197	86440	10	f
198	86440	10	t
199	86440	10	t
200	86440	10	t
21999	26058	5	f
56209	26058	6	f
77124	26058	10	f
10504	26058	8	f
5897	26058	4	f
72726	21408	5	f
45124	21408	8	f
24815	21408	2	f
36021	21408	\N	f
55965	21408	\N	f
64628	86436	\N	f
83825	86436	\N	f
42068	26058	\N	f
44800	26058	\N	f
27902	86436	\N	f
70639	86439	\N	f
9609	86439	\N	f
3972	86439	\N	f
97555	86439	\N	f
94046	21408	\N	f
23641	21408	4	f
55266	21408	5	f
37742	21408	\N	f
87335	21408	\N	f
92931	86440	\N	f
35619	86435	\N	f
90365	86435	4	f
21219	86435	\N	f
82381	86435	\N	f
53660	86435	10	f
69776	86435	\N	f
41900	26058	\N	f
77084	86440	\N	f
32706	86438	\N	f
80627	86439	\N	f
12054	21408	\N	f
26441	86435	\N	f
48747	86438	\N	f
58819	86436	\N	f
24407	86440	\N	f
16813	86433	\N	f
28273	86440	\N	f
87283	86440	\N	f
90305	86440	\N	f
66812	86440	\N	f
81677	86436	\N	f
71970	86436	\N	f
72798	86436	\N	f
78078	86435	\N	f
35038	86435	\N	f
13140	86440	\N	f
64227	86440	\N	f
86293	86440	\N	f
8475	86440	\N	f
17508	86439	\N	f
38518	86439	\N	f
64817	21408	\N	f
49773	86433	\N	f
57186	86433	\N	f
23856	86433	\N	f
6751	86433	\N	f
53720	86440	\N	f
83691	86436	\N	f
76774	86436	\N	f
45737	86436	\N	f
48077	86436	\N	f
27222	86440	\N	f
42344	86440	\N	f
72609	86440	\N	f
74429	86440	\N	f
24289	86440	\N	f
96267	26058	\N	f
39622	52284	\N	f
8863	52284	\N	f
11142	86435	\N	f
8306	86436	\N	f
53231	86436	\N	f
52954	86436	\N	f
31576	86436	\N	f
80293	86436	\N	f
89233	86436	\N	f
96363	86440	\N	f
87006	86440	\N	f
73342	86440	\N	f
23864	86440	\N	f
17449	86440	\N	f
59267	86440	\N	f
29963	86440	\N	f
23885	86440	\N	f
62793	52284	\N	f
70197	86440	\N	f
32910	86440	\N	f
77396	86440	\N	f
81188	86439	\N	f
72808	86438	\N	f
90174	86438	\N	f
92583	86438	\N	f
23660	86438	\N	f
95686	86433	\N	f
22320	86433	\N	f
34985	86435	\N	f
38312	86435	\N	f
15447	21408	\N	f
24475	86440	\N	f
10231	86440	\N	f
71968	76005	\N	f
71191	76005	\N	f
28515	76005	\N	f
20213	86435	\N	f
96690	86435	\N	f
73434	86435	\N	f
99442	48081	\N	f
22330	86440	\N	f
59713	86440	\N	f
\.


--
-- Data for Name: reservation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservation (res_id, t_id, res_date, res_size) FROM stdin;
9381	101	01/21/22	14
9382	110	02/22/22	3
9383	119	01/21/22	4
9384	124	03/24/22	1
9385	142	01/21/22	6
9386	121	08/11/22	9
9390	127	01/21/22	4
9392	131	05/23/22	20
9393	145	02/01/22	9
9395	158	09/16/22	2
9396	167	12/25/22	3
9398	180	08/31/22	5
136576	101	\N	101
35917	101	\N	101
232506	166	\N	\N
371543	171	\N	\N
322290	198	\N	\N
369786	145	\N	\N
188079	192	\N	\N
15550	192	\N	\N
150486	190	\N	\N
110838	160	\N	\N
31052	190	\N	\N
289384	127	\N	\N
\.


--
-- Data for Name: restaurant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restaurant (r_id, r_name, r_address, r_description, r_phone, r_rating, r_image) FROM stdin;
86436	Purist	530 Cooper Lane	Vegan Steak House	305-696-8689	3	https://images.unsplash.com/photo-1623428187969-5da2dcea5ebf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80
86438	Dions	7708 Old Sutor St.	Mom and Pop Pizza togo 	918-665-8039	2	https://images.unsplash.com/photo-1528137871618-79d2761e3fd5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80
86439	The Spicy Jalapeno	7023 W. South Drive	Food so spicy you will love it	205-201-0370	5	https://images.unsplash.com/photo-1628294895950-9805252327bc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80
86433	Uptown Eats	588A Tanglewood Circle	Beautiful Uptown Pizzaria 	336-230-0188	4	https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80
76005	Burger Queen	7224 overthere	Best place, Good burger	222-434-5453	\N	https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=960&q=80
86440	Renaldos's	50 Race Dr. 2323	We sell alot ice cube meals	978-710-3094	1	https://images.unsplash.com/photo-1551024506-0bccd828d307?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=928&q=80
86435	Hilltop	837 Beaver Ridge Ave.	Top steak house with a amazing hill top view	949-812-7289	5	https://images.unsplash.com/photo-1546964124-0cce460f38ef?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80
21408	Bumba	747 hdfh 23232 2j32j	Bees bees bee	2323434343	\N	https://images.unsplash.com/photo-1669926468703-3bd11bad8609?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (rev_id, r_id, rev_text, rev_date, rev_rating, name) FROM stdin;
7581	86433	Delicous meal 10 out of 10 will come again	\N	5	Timone Pumba
42058	86433	Amazing food, Will com for more.	\N	5	Jacob Dew
6456	26058	Amazing food something something	4/23/2023	3	Tommy Langer
74456	26058	enjoyed the food 	10/23/34	4	Timmy Tommy
38463	86433	Meh food	11/3/2022	3	Harkaitz Kalyani
38464	86433	Good food and service	10/31/2022	4	Rahul Walton
38465	86435	Awful food and value	11/23/2022	1	Quinctilianus Zaynab\n
38466	86435	Not recommended	9/29/2022	2	Aleksi Dada\n
38467	86436	Amazing Food!	10/18/2022	5	Ansovald Tiamat\n\n
38468	86436	Good Food!	8/23/2022	5	Mark Armstrong\n
38469	86438	Was average...	10/1/2022	3	Sammy Tyler
38470	86438	Terrible Service	9/4/2022	1	Lauren Norman
38471	86439	Would go back to in the future	10/30/2022	4	Johnnie Price
38472	86439	Not very good food	9/2/2022	2	Rudolph Moran
38473	86440	Decent but service is lacking	10/12/2022	3	Wanda Black
38474	86440	Good family dining	9/16/2022	4	Irene Robinson
59682	21408	idk	idk	2	Idk 
36042	86440	The food was amazing	12/4/2022	4	Tommy
54858	52284	Review Test	12/3/34	3	Name
73600	86440	I liked the food	23/23/23	4	Jake
94232	76005	Its an amazing place	12/4/2022	4	Mai
\.


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (c_id);


--
-- Name: dine_table dine_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dine_table
    ADD CONSTRAINT dine_table_pkey PRIMARY KEY (t_id);


--
-- Name: reservation reservation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_pkey PRIMARY KEY (res_id);


--
-- Name: restaurant restaurant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant
    ADD CONSTRAINT restaurant_pkey PRIMARY KEY (r_id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (rev_id);


--
-- PostgreSQL database dump complete
--

