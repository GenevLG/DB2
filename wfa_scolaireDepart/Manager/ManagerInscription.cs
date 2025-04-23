using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
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
                context = new Glg_bdContext();
                nombreLigneAffectee = context.SaveChanges();
            }
            catch (DbUpdateException ex) 
            {
                if (ex.InnerException is SqlException sqlexception)
                {
                    if (ex.InnerException.Message.Contains("CHECK")&& 
                        ex.InnerException.Message.Contains("note"))
                    {
                        MessageBox.Show("La note doit être entre 0 et 100.");
                    }
                    var ligneErreur = ex.Entries.Single(); //Savoir qu'elle ligne est en erreur                   
                    //Remettre la valeur de la ligne courant à la valeur originale
                    ligneErreur.Property("Note").CurrentValue = //Property = nom de la colonne
                    ligneErreur.Property("Note").OriginalValue; 
                }
            }
            catch (Exception)
            {

                throw;
            }
            return nombreLigneAffectee;
        }
    }
}
