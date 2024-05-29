<template>
    <div class="info-clubs">
      <div class="title-poligon"></div>
      <h3>Els nostres clubs</h3>
      <ul class="clubs-ul">
        <li>
          <img src="../assets/images/clubJunior.jpg" alt="clubJunior.jpg" />
          <h5>JBC Juniors</h5>
          <p class="desc">
            El nostre club per a joves de 16 a 17 anys!
          </p>
        </li>

        <li>
          <img src="../assets/images/clubSabadell.jpg" alt="clubSabadell.jpg" />
          <h5>Sabadell Sud</h5>
          <p class="desc">
            Uneix-te al club de Sabadell on tothom és benvingut.
          </p>
        </li>

        <li>
          <img
            src="../assets/images/clubFem.jpg" alt="clubFem.jpg"
          />
          <h5>Club Wings</h5>
          <p class="desc">
            El nostre equip de lliga femenina sense límit d'edats.
          </p>
        </li>

        <li>
          <img src="../assets/images/club1.jpg" alt="club1.jpg" />
          <h5>BFL</h5>
          <p class="desc">
           Basketball Fire Lion: En la categoria cadet, és el nostre club per a jugadors de 14-15 anys.
          </p>
        </li>

        <li>
          <img src="../assets/images/club2.jpg" alt="club2.jpg" />
          <h5>SBCS</h5>
          <p class="desc">
           Sub Basketball Club Sport: En la categoria Sub-22, és el nostre club per a socis de 18-21 anys.
          </p>
        </li>

        <li>
          <img src="../assets/images/club3.jpg" alt="club3.jpg" />
          <h5>BCT Basquet Club Torroella</h5>
          <p class="desc">
            Uneix-te al club de Torroella de Montgrí on tothom és benvingut.
          </p>
        </li>

          <li>
          <img src="../assets/images/club4.png" alt="club4.png" />
          <h5>Lara Giants</h5>
          <p class="desc">
            Uneix-te al nostre club sènior de Barcelona de on els jugadors de 22 anys en amunt són benvinguts.
          </p>
        </li>

        <li>
          <img src="../assets/images/club5.jpg" alt="club5.jpg" />
          <h5>SCB</h5>
          <p class="desc">
           Sport Club Basketball de Barcelona: El club de lliga professional del nostre ITB club!
          </p>
        </li>

        <li>
          <img src="../assets/images/club6.jpg" alt="club6.jpg" />
          <h5>FEB</h5>
          <p class="desc">
           Equip Femeni Barcelona: El nostre equip femení sènior per a partir de 22 anys.
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
name: 'ClubsInfo'
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
  
  .clubs-ul {
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
  
  .clubs-ul li {
    list-style: none;
    background: white;
    border-radius: 10px;
    padding: 15px;
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
  }
  
  .clubs-ul img {
    width: 100%;
    height: 400px;
    border-radius: 10px;
    box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
  }
  
  .clubs-ul h5 {
    margin: 10px 0;
    font-size: 1.2em;
    color: #333;
  }
  
  .clubs-ul p {
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
  

