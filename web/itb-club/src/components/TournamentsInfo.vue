<template>
    <div class="itournaments">
      <div class="title-poligon"></div>
      <h3>Els nostres Tornejos</h3>
      <ul class="tournaments-ul">

        <li>
          <img src="../assets/images/tournamAmistos.png" alt="tournamAmistos.png" />
          <h5>Partit amistós</h5>
          <p class="desc">
            Juga amb els teus amics en partits amistosos sense ànim de competir. 
          </p>
        </li>

        <li>
          <img src="../assets/images/tournam3vs3.png" alt="tournam3vs3.png" />
          <h5>Torneig 3 contra 3</h5>
          <p class="desc">
            La nostra nova modalitat de 3 contra 3 la qual és una versió innovadora del basket
            en la que es juga amb tres jugadors per equip en mitja pista amb un aro i un tauler.
          </p>
        </li>

        <li>
          <img src="../assets/images/tournam.png" alt="tournam.png" />
          <h5>Tornejos amb copa</h5>
          <p class="desc">
           Els nostres tornejos on cada seu jugarà els seus partits obtenint la seva copa
           per optar al campionat ITB. 
          </p>
        </li>

        <li>
          <img
            src="../assets/images/tournamCampionat.png" alt="clubFem.jpg"
          />
          <h5>Campionat ITB</h5>
          <p class="desc">
            Els millors equips de cada seu del club itb podran participar en un campionat
            on el millor equip s'endurà un premi de 1000€. T'atreveixes a participar?
          </p>
        </li>

        <li>
          <img src="../assets/images/tournamFem.png" alt="tournamFem.png" />
          <h5>Lliga Femenina</h5>
          <p class="desc">
          L'equip femení de l'ITB club juga cada primer diumenge de mes per recaudar fons per ajudar a millorar 
          a les escoles l'esport i l'equipament de basket. Participa!   
          </p>
        </li>
      </ul>
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
name: 'TournamentsInfo'
};
  </script>
  
  <style scoped>
  
  h3{
      font-size: 30px;
      padding-top: 5px ;
      margin-left: 20px;
  }
  h5{
      font-size: 30px !important;
      padding-top: 20px;
      padding-bottom: 20px;
  }
  p{
      font-size: 20px;
  }
  
  .tournaments-ul {
    background: linear-gradient(to right, #a4ded9, #d4f6f4);
    width: 90%;
    height: auto;
    border-radius: 10px;
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    grid-gap: 20px;
    margin: 0 auto;
    padding: 20px;
    box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
    margin-top: 90px;
  }
  
  .tournaments-ul li {
    list-style: none;
    background: white;
    border-radius: 10px;
    padding: 15px;
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
  }
  
  .tournaments-ul img {
    width: 100%;
    height: 600px;
    border-radius: 10px;
    box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
  }
  
  .tournaments-ul h5 {
    margin: 10px 0;
    font-size: 1.2em;
    color: #333;
  }
  
  .tournaments-ul p {
    margin: 5px 0;
    color: #666;
  }
  .desc{
      width: 100%;
      height: 100px;
  }
  .footer {
    position: relative;
    display: flex;
    justify-content: space-around;
    align-items: center;
    padding-top: 30px;
    padding-bottom: 20px;
  }
  
  .footer ul {
    list-style: none;
    display: flex;
  }
  
  .footer ul>li {
    padding: 0 10px;
  }
  </style>
  

