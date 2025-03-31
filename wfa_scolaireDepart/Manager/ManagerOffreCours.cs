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
        public async Task<int?> GetCoursBySessionWithOutput(string session)
        {
            var NombreDeCours = new OutputParameter<int?>();
            using (var context = new Glg_bdContext())
            {
                await context.Procedures.GetTotalCoursesWithOutputAsync(session, NombreDeCours);
            }
            return NombreDeCours.Value;
        }
    }
}
