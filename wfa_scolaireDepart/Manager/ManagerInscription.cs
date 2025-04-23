using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using wfa_scolaireDepart.Models;

namespace wfa_scolaireDepart.Manager
{

    public class ManagerInscription
    {
        Glg_bdContext context;
        //public async Task<List<ListerResultatEtudiantResult>> ListerResultat(string noDA)
        //{
        //    //using (var context = new Glg_bdContext())
        //    //{
        //    //    return await context.Procedures.ListerResultatEtudiantAsync(noDA);
        //    //}
        //}

        public int EnregistrerChangementNote()
        {
            int nombreLigneAffectee = 0;
            try
            {
                nombreLigneAffectee = context.SaveChanges();
            }
            catch (Exception)
            {

                throw;
            }
            return nombreLigneAffectee;
        }
    }
}
