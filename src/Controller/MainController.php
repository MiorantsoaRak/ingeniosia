<?php

namespace App\Controller;

use App\Entity\Dirigeant;
use App\Entity\Societe;
use App\Form\DirigeantType;
use App\Form\SocieteType;
use App\Repository\DirigeantRepository;
use App\Repository\SocieteRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class MainController extends AbstractController
{
    /**
     * @Route("/", name="main")
     */
    public function index(DirigeantRepository $dirigeantRepository, SocieteRepository $societeRepository): Response
    {
        return $this->render('main/index.html.twig', [
            'controller_name' => 'MainController',
            'dirigeants' => $dirigeantRepository->findAll(),
            'societes' => $societeRepository->findAll()
        ]);
    }

    /**
     * @Route("/new", name="dirigeant_societe_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $dirigeant = new Dirigeant();
        $societe = new Societe();
        $form = $this->createForm(DirigeantType::class, $dirigeant);
        $formSociete = $this->createForm(SocieteType::class, $societe);

        $formSociete->handleRequest($request);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($dirigeant);
            $entityManager->flush();

            return $this->redirectToRoute('main', [], Response::HTTP_SEE_OTHER);
        }

        if ($formSociete->isSubmitted() && $formSociete->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($societe);
            $entityManager->flush();

            return $this->redirectToRoute('main', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('main/forms.html.twig', [
            'dirigeant' => $dirigeant,
            'form' => $form,
            'form_societe'=>$formSociete
        ]);
    }
}
