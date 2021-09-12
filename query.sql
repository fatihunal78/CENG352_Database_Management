/*Shows all flight details of any given customer such as "Emre Meric"*/
SELECT F.flightno, F.time, F.fdate, F.dptr_airport, F.arrv_airport, R.seatno
FROM FLIGHTS F, RESERVES R, CUSTOMERS C
WHERE F.flightno=R.flightno AND C.cid = R.cid AND C.name = 'Emre Meric';

/*shows the pilot name staff names and customer names at a specific flight*/
SELECT P.name, P.phone, P.address
FROM PILOTS P, FLIGHTPILOT F
WHERE P.pid = F.pid AND F.flightno = 1;

SELECT S.name, S.phone, S.address
FROM STAFF S, FLIGHTSTAFF F
WHERE S.sid = F.sid AND F.flightno = 1;

SELECT C.name, R.seatno
FROM CUSTOMERS C, RESERVES R
WHERE C.cid = R.cid AND R.flightno = 1;

/*shows all flight details between two given airports at a given specific time interval */
SELECT F.flightno, F.time, F.fdate, F.dptr_airport, F.arrv_airport
FROM CITIES C1, AIRPORTS A1, FLIGHTS F, CITIES C2, AIRPORTS A2
WHERE   C1.name = 'Paris' AND C1.cid = A1.cid AND 
	C2.name = 'Antalya' AND C2.cid = A2.cid AND
	F.dptr_airport = A1.code AND F.arrv_airport = A2.code AND
	'01-June-05' <= F.fdate AND F.fdate <= '08-June-05';

/*shows the details of all airports*/
SELECT A.code, A.name, A.status, C.name, C.country 
FROM AIRPORTS A, CITIES C
WHERE A.cid = C.cid;

/*updates fees of customers who made more than two reservations in a given time interval*/
UPDATE RESERVES R
SET R.fee=R.fee*0.9 
WHERE ( SELECT COUNT(*) 
	FROM RESERVES R1, CUSTOMERS C 
	WHERE '01-May-05' <= R1.resdate AND R1.resdate <= '03-May-05' AND C.cid = R1.cid) > 2;	

/*delete a plane information, its seats, its flights and that plane from owner airline*/
DELETE 
FROM PLANETYPE P
WHERE P.planeid = 1;

