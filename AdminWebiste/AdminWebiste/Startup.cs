using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(AdminWebiste.Startup))]
namespace AdminWebiste
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
