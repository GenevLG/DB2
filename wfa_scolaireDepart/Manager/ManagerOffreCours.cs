using Azure.Core;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using wfa_scolaireDepart.Models;

namespace wfa_scolaireDepart.Manager
{
    public partial class ManagerOffreCours
    {
        Glg_bdContext context;
        public async Task<int?> GetCoursBySessionWithOutput(string session)
        {
            var NombreDeCours = new OutputParameter<int?>();
            using (var context = new Glg_bdContext())
            {
                await context.Procedures.GetTotalCoursesWithOutputAsync(session, NombreDeCours);
            }
            return NombreDeCours.Value;
        }

        public List<VueListerResultat> ListerResultat(int NoOffreCours) 
        {
            List<VueListerResultat> rep = new List<VueListerResultat>();   
            try
            {
                context = new Glg_bdContext();
                rep = context.VueListerResultats.Where(c=>c.NoOffreCours == NoOffreCours).ToList();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Erreur!");
            }
            return rep;
        }
    }
}
