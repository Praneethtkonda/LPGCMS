package routes

import(
	"google.golang.org/grpc"

	"github.com/Praneethtkonda/LPGCMS/server/routes/user"
	// "github.com/Praneethtkonda/LPGCMS/server/routes/app"
	// "github.com/Praneethtkonda/LPGCMS/server/routes/admin"
)

func IncludeRoutes(s grpc.ServiceRegistrar) {
	// Add all router registrations here
	user.AddServer(s)
	// app.AddServer(s)
	// admin.AddServer(s)
}