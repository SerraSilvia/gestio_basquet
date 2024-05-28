<template>
  <div class="home-header">
    <div class="header-content">
      <h5>El nostre esperit</h5>
      <p>
        Som una comunitat esportiva vibrant on els jugadors poden desenvolupar les
        seves habilitats, competir en tornejos i gaudir de l'esport amb diversió
        independentment del seu nivell.
      </p>
    </div>
  </div>
  
    <div class="home-bar">
      <nav>
        <ul class="img-li">
          <li class="home-li">
            <a href="../../facilitiesInfo.html">
              <div class="parallelogram-img">
                <img src="../assets/instalacions.jpg" alt="instalacions" />
              </div>
              <h3>Instal·lacions</h3>
            </a>
          </li>
  
          <li>
            <a href="../rutaClubs">
              <div class="parallelogram-img">
                <img src="../assets/clubs.jpg" alt="clubs" />
              </div>
              <h3>Clubs</h3>
            </a>
          </li>
          <li>
            <a href="../rutaTornejos">
              <div class="parallelogram-img">
                <img src="../assets/tornejos.jpg" alt="tornejos" />
              </div>
              <h3>Tornejos</h3>
            </a>
          </li>
        </ul>
      </nav>
    </div>
  
    <div class="classes">
      <h4>Classes amb els millors</h4>
      <div class="coach">
        <ul>
          <li>
            <img src="../assets/images/entrenador1.jpg" alt="entrenador1.jpg"> 
            <h5>Robert Piera</h5>
          </li>
                    
          <li>
            <img src="" alt="">
            <h5></h5>
          </li>

          <li>
            <img src="" alt="">
            <h5></h5>
          </li>
                    
          <li>
            <img src="" alt="">
            <h5></h5>
          </li>
         
          <li>
            <img src="" alt="">
            <h5></h5>
          </li>
                    
          <li>
            <img src="" alt="">
            <h5></h5>
          </li>
        </ul>
      </div>
    </div>
  
    <div class="leaders">
      <div class="leaders-info">
        <h5>Líders en competir</h5>
        <p>Al nostre club esportiu, ens enorgullim de ser líders en la competència. 
        Organitzem tornejos de primer nivell i oferim programes de formació per ajudar 
        els nostres jugadors a desenvolupar-se i assolir els seus objectius. 
        Uneix-te a nosaltres i descobreix per què som els millors en competir!</p>
      </div>
      <div class="leaders-list">
        <ul>
          <li></li>
        </ul>
      </div>
    </div>
  
    <div class="content-parallelogram">
      <div class="parallelogram"></div>
      <h5>Reserva un camp</h5>
      <p>Per disfrutar del teu esport preferit al nostre club, reserva la teva pista
       amb antel·lació. Fes-ho fàcilment a través de la nostra plataforma en línia o 
       posa't en contacte amb nosaltres. No deixis escapar l'oportunitat de practicar 
       a les nostres instal·lacions!</p>
    </div>
  
      <nav class="footer">
        <ul>
          <li><i class="fa-brands fa-facebook"></i></li>
          <li><i class="fa-brands fa-instagram"></i></li>
          <li><i class="fa-brands fa-square-twitter"></i></li>
          <li><i class="fa-brands fa-youtube"></i></li>
        </ul>
      </nav>
  
  </template>
    
  <script>
  export default {
    name: "HomeComponent",
  };
  </script>
  
  <style>
  .home-header {
    width: 100%;
    height: 300px;
    background: linear-gradient(
      to top,
      rgba(249, 77, 123, 1),
      rgba(244, 90, 69, 0.5)
    );
  }

  .header-content {
    width: 45%;
    float: right;
    padding-top: 30px;
    padding-right:20px ;
  }
  
  .home-bar{
    display: flex;
    justify-content: space-evenly;
  }

  .nav {
    background-color: rgb(224, 60, 49);
    padding:20px;
  }
.home-li{
    display: flex;
    justify-content: space-evenly;

}

  .img-li {
    font-size: 25px;
    list-style: none;
    display: flex;
    justify-content: space-evenly;
    gap:70px;
  }
  
  img {
    width: 100%;
    height: 300px;
  }
 
  .home-li h3{
    color: black;
    text-align: center;
    font-size: 25px;
  }

  .home-li h3:hover{
  color: #4fccc1;
  background-color: #e3f7f5;
	border-radius: 25px;
	padding: 2px;
	padding-left: 3px;
  }

  .parallelogram-img {
    position: relative;
    overflow: hidden;
    /*transform: skew(-10deg); Ajusta el ángulo según tus necesidades */
  }
  
.coach {
  background: linear-gradient(to right, #A4DED9, #D4F6F4);
  width: 80%;
  height: 300px;
  border-radius: 10px;
  display: flex;
  justify-content: center;
  margin: 0 auto; /* Centrado horizontal */
}
.coach img{
    width: 150px; /* Ajusta el tamaño según tus necesidades */
    height: 150px; /* Ajusta el tamaño según tus necesidades */
    object-fit: cover;
    border-radius: 50%;
}
  .leaders {
    background-color: #F94D7B;
    margin-top: 25px;
    width: 100%;
    height: 250px;
  }
  
  .leaders-info {
    width: 40%;
    float: left;
    padding-top:30px;
    padding-left: 20px;
  }
  </style>
  